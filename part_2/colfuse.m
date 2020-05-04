colpath ='c:\projects\lltv\brand\deel2\colfuse\';
graypath ='c:\projects\lltv\brand\deel2\grayfuse\';
dhvpath ='c:\projects\lltv\brand\deel2\dhv\';
radpath ='c:\projects\lltv\brand\deel2\rad\';


for nr = 0:1:16


image1 =  [dhvpath 'DHVheli' int2str(nr) ];
image2 =  [radpath 'RADheli' int2str(nr) ];

dhv =imread([ image1 '.bmp'],'bmp');
ir  =imread([ image2 '.bmp'],'bmp');

dhv = double(dhv)/255;
ir  = double(ir)/255;

grayhv = rgb2gray(dhv);
ir     = ir(:,:,1);

colorfuse(:,:,1)= ir;
colorfuse(:,:,2)= dhv(:,:,2);
colorfuse(:,:,3)= dhv(:,:,1);

grayfuse = fuse_lap(grayhv,ir,7,1,2);

imwrite(grayfuse,[graypath 'gf' int2str(nr) '.tif']);

colorfuse = rgb2ntsc(colorfuse);
colorfuse(:,:,1) = grayfuse;
colorfuse = ntsc2rgb(colorfuse);

imwrite(colorfuse,[colpath 'cf' int2str(nr) '.tif']);

end
