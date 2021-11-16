
clear all;
clc;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num_image = 230;
black_boundary = 1;
filter3 = 85;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k1 = 1;
for ii = 0:5:num_image
    %p1=  sprintf('(Hamed safaie)_10_M13_20x_001_%d.jpg',ii);
    p1=  [num2str(ii),'.jpg'];
    vid=[];
    vid = imread(p1);
    %             p1
    %vid_gray = [];
    vid_gray(:,:,k1) = rgb2gray(vid);
    
    k1 = k1+1;
    if ii ==0
        vid_gray2=rgb2gray(vid);
    end
end
si1 = size(vid)
% si1(2)=1000;
si1(1)=1040;
% imtool(vid);
% ss=si1(1);
% si1(1) = si1(2)
% si1(2) = ss
for hh1 = 1:si1(2)
    for vv1 = 1:si1(1)
        if vid_gray2(vv1,hh1)<=filter3 
            vid_gray(vv1,hh1,:) = 0;
        end
    end
end
for hh1 = 1:si1(2)
    for vv1 = 1:si1(1)
        k1 = 1;
        for ii = 0:5:num_image
            intensity1(k1) = vid_gray(vv1,hh1,k1);           
%             xval(k1)=ii;
            k1 = k1+1;
        end
        [M1,I1]=max(intensity1);
        [M2,I2]=min(intensity1);
        angle_max = (I1-1)*5;
        if angle_max > 90 && angle_max <= 180
            angle_max = 180 - angle_max;
        elseif angle_max > 180
            angle_max = angle_max - 180;
        end
        color_image(vv1,hh1,1) = floor(angle_max*256/90);
        color_image(vv1,hh1,2) = floor(M1-M2);
        color_image(vv1,hh1,3) = 0;
    end
end
% M3 = max(color_image(:,:,2))
% size(M3)
M3 = 0;
for hh1 = 1:si1(2)
    for vv1 = 1:si1(1)
        if color_image(vv1,hh1,2) > M3
            M3 = color_image(vv1,hh1,2);
        end
    end
end
for hh1 = 1:si1(2)
    for vv1 = 1:si1(1)
        color_image(vv1,hh1,2) = floor(color_image(vv1,hh1,2).*256./M3);
    end
end
imwrite(color_image./256,'test11.png')
% %p1=sprintf('Hamed safaie_B4_f92163_10x_001_%d.jpg',1)
% 
imtool(color_image./256);
% vid_gray= rgb2gray(vid);
% %imtool(vid_gray);
% % (640,534)
% % (675,587)
% eval(sprintf('ind=Hamed safaie_B4_f92163_10x_001_%d.jpg',ii+2));
% eval(sprintf('ind_main=ind%d;',ii+2));
% eval(sprintf('ind_main=ind%d;',ii+2));


