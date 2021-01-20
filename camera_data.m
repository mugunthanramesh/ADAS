function camera_data(mypi,detector)
cam1 = webcam(mypi,1);
cam2 = webcam(mypi,2);
cam3 = webcam(mypi,3);
cam4 = webcam(mypi,4);
    %figure(1)
    i1 = snapshot(cam1);
    I1 = imresize(i1,[448 448]);
    try
        [bboxes1,scores1,labels1] = detect(detector,I);
        I = insertObjectAnnotation(I,'rectangle',bboxes,cellstr(labels));
        imshow(I)
        %detected_images = detected_images+1;
        %disp(scores)
    catch
        fprintf("No obstacle is found\n");
        scores1 = 0.5;
        labels1 = 'None';
        %disp(scores)
        %non_detected_images = non_detected_images+1;
    end
    %imshow(i1);
    %figure(2)
    i2 = snapshot(cam2);
    I2 = imresize(i2,[448 448]);
    try
        [bboxes2,scores2,labels2] = detect(detector,I);
        I = insertObjectAnnotation(I,'rectangle',bboxes,cellstr(labels));
        imshow(I)
        %detected_images = detected_images+1;
        %disp(scores)
    catch
        fprintf("No obstacle is found\n");
        scores2 = 0.5;
        labels2 = 'None';
        %disp(scores)
        %non_detected_images = non_detected_images+1;
    end
    %imshow(i2);
    %figure(3)
    i3 = snapshot(cam3);
    I3 = imresize(i3,[448 448]);
    try
        [bboxes3,scores3,labels3] = detect(detector,I);
        I = insertObjectAnnotation(I,'rectangle',bboxes,cellstr(labels));
        imshow(I)
        %detected_images = detected_images+1;
        %disp(scores)
    catch
        fprintf("No obstacle is found\n");
        scores3 = 0.5;
        labels3 = 'None';
        %disp(scores)
        %non_detected_images = non_detected_images+1;
    end
    %imshow(i3);
    %figure(4)
    i4 = snapshot(cam4);
    I4 = imresize(i4,[448 448]);
    try
        [bboxes4,scores4,labels4] = detect(detector,I);
        I = insertObjectAnnotation(I,'rectangle',bboxes,cellstr(labels));
        imshow(I)
        %detected_images = detected_images+1;
        %disp(scores)
    catch
        fprintf("No obstacle is found\n");
        scores4 = 0.5;
        labels4 = 'None';
        %disp(scores)
        %non_detected_images = non_detected_images+1;
    end
    %imshow(i4);
    scores = [scores1,scores2,scores3,scores4];
    label = [labels1,labels2,labels3,labels4];
    getFile(mypi,'sense.csv');
    a = csvread('sense.csv');
    a = a(end,:);
    a = a.*10;
    a(a>50) = 50;
    a = round(a);
    map_cv(a,scores);
end
