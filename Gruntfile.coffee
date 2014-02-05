module.exports = (grunt) ->
  
  grunt.cacheMap = []
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    bushcaster:
      options:
        hashLength: 8
        noProcess: true
        onComplete: (map, files) ->
          files.forEach((file)->
            grunt.cacheMap.push(
              pattern: file
              replacement: map[file]
            )
          )
      main:
        files: [
          expand: true
          cwd: "./"
          src: ["assets/mq-base.css", "assets/favicon.ico"] #files to cache bust. 
          dest: "./"
        ]
    'string-replace':
      dist:
        files:
          'build/': '*.html' # dest: source
      options:
        replacements: grunt.cacheMap
        
  grunt.loadNpmTasks "grunt-string-replace"
  grunt.loadNpmTasks "grunt-bushcaster"
  
  grunt.registerTask "bustcache", ["bushcaster", "string-replace:dist"]
