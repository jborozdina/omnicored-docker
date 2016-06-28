# omnicored-docker

docker build -t jborozdina/omnicored .

docker run -d -p 18332:18332 --name omnid jborozdina/omnicored

curl -H "Content-Type: application/json" -H "Authorization: Basic cnBjOnBhc3M=" -X POST -d '{"method": "omni_getinfo", "params": [], "id": "juliatest"}' http://localhost:18332
