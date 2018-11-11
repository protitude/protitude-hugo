build:
	rm -rf public
	hugo

deploy: build
	aws s3 sync public/ s3://protitude-hugo --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E2DUXCSER0ZJFK --paths '/*'
