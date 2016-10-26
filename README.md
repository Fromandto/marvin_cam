This an implentation of 'class activation mapping' in marvin.

Usage:

(1) create a folder examples/cam/ in your marvin root path
    move all files here to examples/cam/

(2) download image file 'experiment1_images.tensor' from this link:

    download pre-trained 'final.marvin' from this link:

    download marvin alexnet pre-trained model 'alexnet_imagenet_half.marvin' from this link:
	http://vision.princeton.edu/marvin/models/alexnet_imagenet/alexnet_imagenet_half.marvin

(3) [optional] train your model with this command in marvin root path:
	./marvin train examples/cam/alexnet_imagenet_cam.json examples/cam/alexnet_image_half.marvin
	after training (takes about 10 mins):
	rename '.marvin' with 'final.marvin' or other names you like

(4) calculate intermediate results with comannd:
	./marvin test examples/cam/alexnet_imagenet_cam.json examples/cam/final.marvin conv5 examples/cam/conv5.tensor
	./marvin test examples/cam/alexnet_imagenet_cam.json examples/cam/final.marvin fc_cam examples/cam/fc_cam.tensor

(5) calculate CAM results with 'cam.m'
