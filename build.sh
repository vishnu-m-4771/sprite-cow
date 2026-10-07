ver=9

rm -rf dist

mkdir dist
mkdir dist/assets
mkdir dist/assets/$ver
mkdir dist/assets/$ver/script
mkdir dist/assets/$ver/style

cp www/assets/favicon.ico dist/assets/$ver/
cp www/assets/tutorial-sprite.png dist/assets/$ver/
cp -r www/assets/style/fonts dist/assets/$ver/style/
cp -r www/assets/style/imgs dist/assets/$ver/style/
sed -e 's/\/$ver\//\/'"$ver"'\//g' www/index.html > dist/index.html
sed -e 's/\/$ver\//\/'"$ver"'\//g' www/offline.appcache > dist/offline.appcache
sed -e 's/\/$ver\//\/'"$ver"'\//g' www/_headers > dist/_headers
cat www/assets/script/jquery-1.7.1.js www/assets/script/jquery.easing.js www/assets/script/jquery.transition.js www/assets/script/jquery.fileClickjack.js www/assets/script/intro.js www/assets/script/MicroEvent.js www/assets/script/Rect.js www/assets/script/ImgInput.js www/assets/script/SpriteCanvas.js www/assets/script/SpriteCanvasView.js www/assets/script/InlineEdit.js www/assets/script/CssOutput.js www/assets/script/Toolbar.js www/assets/script/pageLayout.js www/assets/script/FeatureTest.js www/assets/script/featureTests.js www/assets/script/base.js | uglifyjs -cm > dist/assets/$ver/script/mainmin.js
sass --style=compressed --no-source-map www/assets/style/all.scss dist/assets/$ver/style/all-min.css
