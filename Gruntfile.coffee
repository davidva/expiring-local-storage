module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    meta:
      src: 'src/**/*.coffee'
      specs: 'specs/**/*.coffee'
      srcGen: 'dist/<%= pkg.name %>.js'
      specsGen: 'tmp/<%= pkg.name %>_spec.js'

    coffee:
      compile:
        files:
          '<%= meta.srcGen %>': ['<%= meta.src %>']
          '<%= meta.specsGen %>': ['<%= meta.specs %>']

    jshint:
      all: ['Gruntfile.js', '<%= meta.srcGen %>', '<%= meta.specsGen %>']
      options:
        jshintrc: '.jshintrc'

    jasmine:
      src: '<%= meta.srcGen %>'
      options:
        specs: '<%= meta.specsGen %>'

    watch:
      test:
        files: ['<%= meta.src %>','<%= meta.specs %>']
        tasks: 'test'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'test', ['coffee','jshint','jasmine']

  grunt.registerTask 'default', ['test']
