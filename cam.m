activation = readTensors('conv5.tensor');
activation = activation.value;
net = readTensors('final.marvin');
weight = net(11).value;
output = readTensors('fc_cam.tensor');
output = output.value;
images = readTensors('experiment1_images.tensor');
images = images.value;
cs = jet(256);
name{1} = 'aeroplane'; name{2} = 'bike'; name{3} = 'bird'; name{4} = 'boat'; name{5} = 'bottle'; name{6} = 'bus'; name{7} = 'car'; name{8} = 'cat'; name{9} = 'chair'; name{10} = 'cow'; name{11} = 'table'; name{12} = 'dog'; name{13} = 'horse'; name{14} = 'motorbike'; name{15} = 'person'; name{16} = 'plant'; name{17} = 'sheep'; name{18} = 'sofa'; name{19} = 'train'; name{20} = 'television';

for i = 1 : size(activation , 4)
    output2 = output(1 , 1 , : , i);
    [~ , output3] = max(output2 , [] , 3);
    weight2 = weight(output3 , :);
    activation2 = activation(: , : , : , i);
    viz = zeros(size(activation2 , 1) , size(activation2 , 2));
    for j = 1 : size(weight2 , 2)
        viz = viz + weight2(j) * activation2(: , : , j);
    end
    images2 = uint8(images(: , : , : , i));
%     images2 = repmat(images2 , [1 , 1 , 3]);
    viz = imresize(viz , [227 , 227]);
    viz = (viz - min(min(viz))) * 255 / (max(max(viz)) - min(min(viz)));
    viz = uint8(viz);
    viz2 = zeros(227 , 227 , 3);
    for j = 1 : 227
        for k = 1 : 227
            viz2(j , k , 1) = cs(viz(j , k) + 1 , 1);
            viz2(j , k , 2) = cs(viz(j , k) + 1 , 2);
            viz2(j , k , 3) = cs(viz(j , k) + 1 , 3);
        end
    end
    viz3 = uint8(0.5 * viz2 * 255) + 0.5 * images2;
    figure('color' , 'white');
    imshow(viz3) , xlabel(name{output3});
    ginput(1);
    close all;
end