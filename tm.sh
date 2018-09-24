#!/bin/bash
#думаю добавить гит.....
echo Hello what the name of directory
read dir_name
mkdir $dir_name
cd $dir_name
echo "var gulp = require('gulp');
    sass         = require('gulp-sass'), //Подключаем Sass пакет,
    browserSync  = require('browser-sync'), // Подключаем Browser Sync
    concat       = require('gulp-concat'), // Подключаем gulp-concat (для конкатенации файлов)
    uglify       = require('gulp-uglifyjs'), // Подключаем gulp-uglifyjs (для сжатия JS)
    cssnano      = require('gulp-cssnano'), // Подключаем пакет для минификации CSS
    rename       = require('gulp-rename'), // Подключаем библиотеку для переименования файлов
    del          = require('del'), // Подключаем библиотеку для удаления файлов и папок
    imagemin     = require('gulp-imagemin'), // Подключаем библиотеку для работы с изображениями
    pngquant     = require('imagemin-pngquant'), // Подключаем библиотеку для работы с png
    cache        = require('gulp-cache'), // Подключаем библиотеку кеширования
    autoprefixer = require('gulp-autoprefixer');// Подключаем библиотеку для автоматического добавления префиксов
    notify        = require('gulp-notify');


gulp.task('sass', function(){
    return gulp.src('app/sass/**/*.sass') // Берем источник
		.pipe(sass({outputStyle: 'expand'}).on(error, notify.onError()))
		.pipe(sass()) // Преобразуем Sass в CSS посредством gulp-sass
		.pipe(autoprefixer(['last 15 versions', '> 1%', 'ie 8', 'ie 7'], { cascade: true })) // Создаем префиксы
		.pipe(gulp.dest('app/css')) // Выгружаем результатыа в папку app/css
		.pipe(browserSync.reload({stream: true})); // Обновляем CSS на странице при изменении
});
    
gulp.task('browser-sync', function() { // Создаем таск browser-sync
	browserSync({ // Выполняем browserSync
		server: { // Определяем параметры сервера
			baseDir: 'app' // Директория для сервера - app
		},
		notify: false // Отключаем уведомления
	});
});


// gulp.task('css-libs', ['sass'], function() {
// 	return gulp.src('app/css/libs.css') // Выбираем файл для минификации
// 		.pipe(cssnano()) // Сжимаем
// 		.pipe(rename({suffix: '.min'})) // Добавляем суффикс .min
// 		.pipe(gulp.dest('app/css')); // Выгружаем в папку app/css
// });

gulp.task('watch', ['browser-sync'], function() {
	gulp.watch('app/sass/**/*.sass', ['sass']); // Наблюдение за sass файлами в папке sass
	gulp.watch('app/*.html', browserSync.reload); // Наблюдение за HTML файлами в корне проекта
	gulp.watch('app/js/**/*.js', browserSync.reload);   // Наблюдение за JS файлами в папке js
});

gulp.task('clean', function() {
	return del.sync('dist'); // Удаляем папку dist перед сборкой
});
gulp.task('img', function() {
	return gulp.src('app/img/**/*') // Берем все изображения из app
		.pipe(cache(imagemin({ // С кешированием
		// .pipe(imagemin({ // Сжимаем изображения без кеширования
			interlaced: true,
			progressive: true,
			svgoPlugins: [{removeViewBox: false}],
			use: [pngquant()]
		}))/**/)
		.pipe(gulp.dest('dist/img')); // Выгружаем на продакшен
});

gulp.task('build', 'sass' ['clean'], function() {

	var buildCss = gulp.src([ // Переносим библиотеки в продакшен
		'app/css/master.css'
		])
	.pipe(gulp.dest('dist/css'))

	var buildFonts = gulp.src('app/fonts/**/*') // Переносим шрифты в продакшен
	.pipe(gulp.dest('dist/fonts'))

	var buildJs = gulp.src('app/js/**/*') // Переносим скрипты в продакшен
	.pipe(gulp.dest('dist/js'));

	var buildHtml = gulp.src('app/*.html') // Переносим HTML в продакшен
	.pipe(gulp.dest('dist'));
	

	var buildImg = gulp.src('app/img/**/*')// переносим изображения в продактшион
	.pipe(gulp.dest('dist/img'));

});
gulp.task('clear', function (callback) {
	return cache.clearAll();
})

gulp.task('default', ['watch']);"> gulpfile.js
echo "Создано из шаблона"> README.md
npm init -y
npm i -D gulp browser-sync gulp-sass gulp-sass gulp-concat gulp-uglifyjs gulp-cssnano gulp-rename del gulp-imagemin imagemin-pngquant gulp-cache gulp-autoprefixer gulp-notify
mkdir app
cd app
echo "<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="web">
    <meta name="keywords" content="web">
    <meta name="author" content="Yakupov">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/index.js"></script>
    <title></title>
    <link rel="icon"  type="image/png" href="img/favicon.png">
</head>
<body>
<h1> Hello</h1>




</body>
</html>"> index.html
mkdir img
mkdir js
cd js
touch main.js
cd ../
mkdir sass
cd sass
echo "@import 'base/_base.sass'
@import 'base/_mixins.sass'
@import 'base/_var.sass'
@import 'base/_norm.sass'

@import 'layouts/_fonts.sass'
@import 'layouts/_buttons.sass'
@import 'layouts/_header.sass'
@import 'layouts/_main.sass'
@import 'layouts/_mobile.sass'
"> style.sass
mkdir base
cd base
touch _base.sass
touch _mixins.sass
echo "// http://meyerweb.com/eric/tools/css/reset/
//  v2.0 | 20110126
//  License: none (public domain)

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video 
    margin: 0
    padding: 0
    border: 0
    font-size: 100%
    font: inherit
    vertical-align: baseline

// HTML5 display-role reset for older browsers
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section 
    display: block

body 
    line-height: 1

ol, ul 
    list-style: none

blockquote, q 
    quotes: none

blockquote:before, blockquote:after
q:before, q:after 
    content: ''
    content: none

table 
    border-collapse: collapse
    border-spacing: 0
">_norm.sass
touch _var.sass
cd ../
mkdir layouts
cd layouts
touch _header.sass
touch _main.sass
touch _mobile.sass
touch _buttons.sass
mkdir _fonts.sass
cd ../
cd ../
mkdir css
cd css
touch style.css
cd ../
cd ../
echo "/node_modules/">.gitignore
git init
git add --all
git commit -m "first commit"
git remote add origin https://github.com/isakura313/$dir_name.git

code .
gulp
