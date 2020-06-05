/**
 * Created by Administrator on 2017/10/25.
 */
var gulp = require('gulp'),
    uglify = require('gulp-uglify'),
    less = require('gulp-less'),
    connect = require('gulp-connect'),
    //livereload = require('gulp-livereload'),
    imagemin = require('gulp-imagemin'),
    minifyHtml = require("gulp-minify-html");
var pngquant = require('imagemin-pngquant'); //png图片压缩插件
var smushit = require('gulp-smushit');// smushit对PNG图片具有更好的压缩效果
var minifyCss = require('gulp-minify-css');// css压缩
// var webserver = require('gulp-webserver');// gulp-webserver

/*// 加载gulp-load-plugins插件，并马上运行它
var plugins = require('gulp-load-plugins')();*/

// 定义压缩html任务
gulp.task('minify-html', function () {
    gulp.src(['src/html/**/*.html'])
    //.pipe(minifyHtml()) //压缩
    //.pipe(gulp.dest('dist/html'))
        .pipe(connect.reload());
});

// 定义压缩js任务
gulp.task('uglify', function () {
    gulp.src(['src/js/**/*.js'])
    //.pipe(uglify()) //压缩
    //.pipe(gulp.dest('dist/js'))
        .pipe(connect.reload());
});

// 定义html任务
gulp.task('html', function () {
    gulp.src('src/html/**/*.html')
    //.pipe(gulp.dest('dist/html'))
        .pipe(connect.reload());
});

// 定义Less任务
gulp.task('less', function() {
    gulp.src('src/less/**/*.less')
        .pipe(less())
        .pipe(gulp.dest('src/css'))
        .pipe(connect.reload());
});

// 定义图片压缩任务
gulp.task('imagemin', function() {
    gulp.src('src/img/**')
        .pipe(imagemin({
            progressive: false,
            optimizationLevel: 1,
            use: [pngquant()] //使用pngquant来压缩png图片
        }))
    //.pipe(gulp.dest('dist/img'));
});
/*gulp.task('smushit', function() {
 gulp.src('src/img/!**')
 .pipe(smushit({
   verbose: true
 }))
 .pipe(gulp.dest('dist/img'));
 });*/

// 定义css任务
gulp.task('minifyCss', function () {
    gulp.src('src/css/**.css')
    //.pipe(gulp.dest('dist/css'))
    //.pipe(minifyCss())
        .pipe(connect.reload());
});

// 定义看守任务
gulp.task('watch', function() {
    //livereload.listen(); //要在这里调用listen()方法 当代码变化时，它可以帮我们自动刷新页面
    gulp.watch('src/less/**/*.less', ['less']);
    gulp.watch('src/html/**/*.html', ['html']);
    gulp.watch('src/css/**/*.css', ['minifyCss']);
    gulp.watch('src/js/**/*.js', ['uglify']);

});

// 定义livereload任务
gulp.task('connect', function() {
    connect.server({
        port: 9999,
        host: '192.168.40.56',
        livereload: true
    });

});

/*gulp.task('webserver', function() {
  gulp.src('src')
    .pipe(webserver({
      livereload: true,
      directoryListing: true,
      open: true
    }));
});*/

// 定义默认任务
gulp.task('default',['less', 'minify-html', 'html', 'watch', 'connect', 'imagemin', 'uglify', 'minifyCss'],function () {
    console.log('hello world!')
});
