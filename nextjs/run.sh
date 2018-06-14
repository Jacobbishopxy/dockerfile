# build the image based on the Dockerfile and name it
docker build -t xy/nextjs-project .

# run nextjs project
docker run -d -p 3001:3000 xy/nextjs-project
