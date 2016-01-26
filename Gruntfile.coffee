module.exports = (grunt) ->

  catchAllFiles = ['**/*.*', '!**/*.jade', '!**/*.styl',]

  grunt.initConfig

    watch:

      jade:
        files: 'source/**/*.jade'
        tasks: 'jadephp'
        options:
          livereload: 1337

      stylus:
        files: 'source/**/*.styl'
        tasks: 'stylus'
        options:
          livereload: 1337

      catchAll:
        files: catchAllFiles
        tasks: 'newer:copy'
        options:
          livereload: 1337

    jadephp:
      compile:
        options:
          filename: 'default'
          pretty: true
        files: [
          expand: true
          cwd: 'source'
          src: ['**/*.jade']
          dest: 'compiled'
          ext: '.php'
        ]

    stylus:
      compile:
        files: [
          expand: true
          cwd: 'source'
          src: ['**/*.styl']
          dest: 'compiled'
          ext: '.css'
        ]

    copy:
      catchAll:
        files: [
          cwd: 'source'
          src: catchAllFiles
          dest: 'compiled/'
          expand: true
        ]

  grunt.registerTask 'default',
    [
      'jadephp'
      'stylus'
      'copy'
      'watch'
    ]

  grunt.loadNpmTasks 'grunt-jade-php'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-newer'
