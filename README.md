# Ureport

# Some random change to see if we can trigger south sudan pipeline

Ureport is a user-centered social monitoring tool designed to strengthen community-led development and citizen engagement. It allows users to speak out on what is happening in their community and feeds back useful information to assist users to enact change in your community.

Technically speaking, Ureport leverages the work of rapidsms-polls  to provide an easy system for polling a large number of users, and adds a visualization layer to aggregate poll results exposed in as JSON in the polling app.

A running example of ureport can be viewed at ureport.ug

# Dev machine setup

## Get the SOURCE!

Ok, so you have been given access to `southsudan/ureport`, Welcome to the team!

This repository currently makes heavy use of git submodules and branching so there are a few things you need to do before beginning work.

Before you start, find a good place to put all the code. The team tends to do something like

    mkdir ~/code/ureport/south_sudan
    cd ~/code/ureport/south_sudan

First clone this repository. Because eveything is called "ureport" we tend to clone it with the name of "master-repo", but whatever you are comfortable with

    git clone git@github.com:southsudan/ureport.git master-repo
    
    cd master-repo
    
At this point you won't have the submodules initialised, some

    git submodule update --init
    
    git submodule foreach git checkout south_sudan
    
    git submodule foreach git pull origin south_sudan
    
These will take some time. You can verify that everything is ok by doing 

    git submodule foreach git status
    
For each submodule you should see something like:

    Entering 'ureport_project/<*****>'
    # On branch south_sudan
    nothing to commit, working directory clean

Where `<*****>` is the name of the submodule

Ok you now have a working codebase hopefully.

## TODO - Initialise the database
## TODO - Run the server and celery
## TODO - Setup geoserver

## Making changes

So now you have a working local environment and your ready for your first commit!

Because we want the code to be publically cloneable, all of the submodules are configured to point to readonly GIT urls, for example

    git://github.com/unicefuganda/rapidsms-ureport.git
    
We need them to be the ssh url if we want to be able to make pushes.

    git@github.com:unicefuganda/rapidsms-ureport.git
    
To do this, we need to replace the `origin` for each submodule with the ssh version. Fortunately the team have provided you with a script that does this to save you lots of typing...

    cd ~/code/ureport/south_sudan
    
    ./make-repo-writable.sh 
    
It will double check with you.

You can verify this by doing

    git submodule foreach git remote -v

Each one should look like this:

    origin	git@github.com:unicefuganda/rapidsms-xforms.git (fetch)
    origin	git@github.com:unicefuganda/rapidsms-xforms.git (push)

It is vital that when you are pushing to one of the submodules you double check that you are on the south_sudan branch

    git branch
    
It should say

      master
    * south_sudan

HEALTH WARNING!!! If you push south_sudan specific changes to the `master` you will overwrite the ureport.ug website!


