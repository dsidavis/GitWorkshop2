
Consider the RCInterface repository for the DSI workshops.
We developed code in several subdirectories within this repository.
One of these subdirectories - Rqpdf - took on a life of its own and became
useful. So we wanted to a) convert that subdirectory into its own top-level repository,
 b) maintain all of the history of the changes for the files within the Rqpdf subdirectory
 
To be clear we started with
```
  ...
  RCInterface/Plus
  RCInterface/Rqpdf
  ...
```
and we want to end up with a directory 
that contains all of the files within Rqpdf, e.g. DESCRIPTION, NAMESPACE, src/, R/, inst/ etc.
in this top-level directory and have that be a git repository containing nothing but the files we
had in Rqpdf, i.e.,
```
 DESCRIPTION
 NAMESPACE
 R/
 src/
 ... 
```



We start by copying or cloning the original RCInterface directory or repository.
If we clone the repository, we won't get any extraneous files that were left over in our
local directory. If we want these, we copy our local directory.  I chose to copy
the local directory

```
mkdir GitExpt
cd GitExpt
cp -r ~/DSI/Workshops/RCInterface .
```

Alternatively,
```
mkdir GitExpt
cd GitExpt
git clone https://github.com/dsidavis/RCInterface.git
```

When we copy the local directory, I chose to remove the local files I know we don't need.
We could identify the files git ignores with
```
git ls-files --other
```
but this also identifies the untracked files.
These untracked foles are the ones we want to keep.
So we need to filter only the ignored files.

We might use
```
git check-ignore **/*
```
<!-- is this bash-specific -->

Another approach is
```
git clean -ndX
```

We can also use
```
git status --ignored
```
After the git clean without the -n, this shows
```
	Plus/plus
	Rqpdf/configure
	Rqpdf/inst/sampleDocs/OoPdfFormExample_uncompressed.pdf
	Rqpdf/src/Makevars
```
We want to remove all but the third one of these.
We can possibly do this manually.


As an alternative to using git to figure out what to remove,  we could do this manually
with 
```
find . -name '*~' -exec rm {} \;
find . -name 'configure' -exec rm {} \;
rm `find . -name '*.in' | sed -e 's/.in//' `
find . -name '*.o' -exec rm {} \;
find . -name '*.so' -exec rm {} \;
```

# Splitting the Repository to Leave Rqpdf

The key command to remove all of the other directories and lift the files from Rqpdf 
to the top-level is
```
git filter-branch --prune-empty --subdirectory-filter Rqpdf  master
```

After this we have
```
ls
DESCRIPTION		    R/			    err.c			tests/
DebuggingSegFault	Rqpdf/			inst/
NAMESPACE		    configure.in	src/
```
We can see that the DESCRIPTION, NAMESPACE, src/, R/,  tests/ .... files and 
directories were moved to the current directory, and almost everything else was removed.

We do see the Rqpdf/ directory. What is in this?
```
find Rqpdf
Rqpdf
Rqpdf/inst
Rqpdf/inst/sampleDocs
Rqpdf/inst/sampleDocs/OoPdfFormExample_uncompressed.pdf
```
So the one outstanding file that was not tracked and that we were interested in -
OoPdfFormExample_uncompressed.pdf - caused this directory not to be removed.

So we might decide to copy this from Rqpdf/inst/sampleDocs/OoPdfFormExample_uncompressed.pdf
to ./inst/sampleDocs/OoPdfFormExample_uncompressed.pdf.
Alternatively, we can recreate the uncompressed version of this pdf file.
I have have a pdf_uncompress script in my home directory to do this
which we can show with
```
cat `which pdfuncompress`
```
```
#!/bin/sh

out="$2"

# If the second argument is not provided, we write to a file named foo.
if test "$out" = "" ; then
    out=`echo $1 | sed -e s/.pdf$/_uncompressed.pdf/`
#    echo "$out"
fi

qpdf --qdf --object-streams=disable "$1" "$out"
```
Coincidentally, we use qpdf to create the uncompressed version of a PDF file.

But let's copy this file across
```
cp Rqpdf/inst/sampleDocs/OoPdfFormExample_uncompressed.pdf inst/sampleDocs/
```
We need to add it to the git repository. We can check this with
```
git status
```
```
On branch master
Your branch and 'origin/master' have diverged,
and have 15 and 25 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	Rqpdf/
	inst/sampleDocs/OoPdfFormExample_uncompressed.pdf

nothing added to commit but untracked files present (use "git add" to track)
```

We can now remove the Rqpdf directory  since we know that has only one file that we just copied.
```
rm -fr Rqpdf
```
And we add 
```
git add inst/sampleDocs/OoPdfFormExample_uncompressed.pdf
```

At this point we are ready to push the contents of this locally changed repository to a 
central repository.
We create a new repository on github or bitbucket or gitlab.

Before we push the repository, let's check the package still installs correctly.
```
R CMD INSTALL .
```
Curiously, this fails.
```
* installing to library ‘/Users/duncan/Rpackages’
* installing *source* package ‘Rqpdf’ ...
** libs
g++ -std=gnu++11 -I"/Users/duncan/R-devel/build/include" -DNDEBUG   -I/usr/local/include   -fPIC  -g -c expt.cc -o expt.o
gcc -I"/Users/duncan/R-devel/build/include" -DNDEBUG   -I/usr/local/include   -fPIC  -g -Wall -c fileVersion.c -o fileVersion.o
g++ -std=gnu++11 -I"/Users/duncan/R-devel/build/include" -DNDEBUG   -I/usr/local/include   -fPIC  -g -c formValues.cc -o formValues.o
gcc -I"/Users/duncan/R-devel/build/include" -DNDEBUG   -I/usr/local/include   -fPIC  -g -Wall -c info.c -o info.o
g++ -std=gnu++11 -I"/Users/duncan/R-devel/build/include" -DNDEBUG   -I/usr/local/include   -fPIC  -g -c numPages.cc -o numPages.o
gcc -I"/Users/duncan/R-devel/build/include" -DNDEBUG   -I/usr/local/include   -fPIC  -g -Wall -c qpdf.c -o qpdf.o
gcc -I"/Users/duncan/R-devel/build/include" -DNDEBUG   -I/usr/local/include   -fPIC  -g -Wall -c qpdfData.c -o qpdfData.o
g++ -std=gnu++11 -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/usr/local/lib -o Rqpdf.so expt.o fileVersion.o formValues.o info.o numPages.o qpdf.o qpdfData.o -Wl,-framework -Wl,CoreFoundation
ld: warning: text-based stub file /System/Library/Frameworks//CoreFoundation.framework/CoreFoundation.tbd and library file /System/Library/Frameworks//CoreFoundation.framework/CoreFoundation are out of sync. Falling back to library file for linking.
installing to /Users/duncan/Rpackages/Rqpdf/libs
** R
** inst
** byte-compile and prepare package for lazy loading
** help
No man pages found in package  ‘Rqpdf’ 
*** installing help indices
** building package indices
** testing if installed package can be loaded
Error: package or namespace load failed for ‘Rqpdf’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/Users/duncan/Rpackages/Rqpdf/libs/Rqpdf.so':
  dlopen(/Users/duncan/Rpackages/Rqpdf/libs/Rqpdf.so, 6): Symbol not found: __ZN16QPDFObjectHandle11getIntValueEv
  Referenced from: /Users/duncan/Rpackages/Rqpdf/libs/Rqpdf.so
  Expected in: flat namespace
 in /Users/duncan/Rpackages/Rqpdf/libs/Rqpdf.so
Error: loading failed
recover called non-interactively; frames dumped, use debugger() to view
* DONE (Rqpdf)
```
Everything worked for compiling and linking the C/C++ code, and installing the R code.
The problem was with loading.
The key error message was
```
Error: package or namespace load failed for ‘Rqpdf’ in dyn.load(file, DLLpath = DLLpath, ...):
 unable to load shared object '/Users/duncan/Rpackages/Rqpdf/libs/Rqpdf.so':
  dlopen(/Users/duncan/Rpackages/Rqpdf/libs/Rqpdf.so, 6): Symbol not found: __ZN16QPDFObjectHandle11getIntValueEv
  Referenced from: /Users/duncan/Rpackages/Rqpdf/libs/Rqpdf.so
  Expected in: flat namespace
 in /Users/duncan/Rpackages/Rqpdf/libs/Rqpdf.so
Error: loading failed
```
This is hard to diagnose. 
This has to do with the compiled code, and specifically the C++ code since this shows name mangling.
For some intuitive reason, I did two things. The first was  clearing out all of the .o and .so
files in the src/ directory and re-installing the package. This gave the same error.
So we had to hypothesize a second cause.
For no particular cause/explanation/reason - except experience and familiarity with the structure of
this package, I guess that the problem was that our configure script was not working correctly.
And then I recognized that we didn't have a configure script since that is derived from configure.in
and we had removed the configure script in our purge. So I regenerated the `configure` script with
```
autoconf
```
The we re-installed, but again, removing all the .o and .so's with
```
rm src/*.o src/*.so
R CMD INSTALL .
```
The package installed and loaded without problems.

So now we connect this repository to the new github repository with
```
git remote add origin git@github.com:dsidavis/RCInterface.git
```
and then we push our current state with
```
git push -u origin master
```

