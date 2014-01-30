module.exports = (grunt) ->
  
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    bushcaster:
      options:
        hashLength: 8
        noProcess: "*.ico"
      main:
        files: [
          expand: true
          cwd: "./"
          src: ["favicon.ico"]
          dest: "./"
        ]
  grunt.loadNpmTasks "grunt-bushcaster"
