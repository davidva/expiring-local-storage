expiring-local-storage
======================
JS class to use HTML5 local storage with expiration date and default value.

How to build
------------

Clone a copy of the git repo by running:

    git clone https://github.com/summun/expiring-local-storage

Install the grunt-cli package:

    npm install -g grunt-cli

Enter the directory and install the Node dependencies:

    npm install

Make sure you have `grunt` installed by testing:

    grunt -version

To get a complete, linted (w/ JSHint) version, type the following:

    grunt

The built version will be put in the `dist/` subdirectory.

Running the Tests
-----------------

Execute the tests (includes Jasmine and JSHint):

    grunt test

Start grunt to auto-build the project as you work:

    grunt watch

For a more verbose tests you can open `SpecRunner.html` in your browser.
