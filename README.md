# docker-lfs-test-server
Github's git large file support (LFS) test server Dockerized  

Upstream: https://github.com/github/lfs-test-server

### Usage

1. [**Install docker**](https://docs.docker.com/installation/)
1. **Download and start the lfs-test-server instance**  

  ```
docker run --name lfs -p 9999:9999 -d l3iggs/lfs-test-server
```
1. **Add a user via the server's web interface**  
Point your browser to http://localhost:9999/mgmt  
(the default user/pass is admin/admin)  
1. [**Install the LFS plugin for git**](https://git-lfs.github.com/)
1. **Tell your git repository about your new LFS server**  
Add the following to your the .gitconfig file in your git repository:

  ```
[lfs]
    url = "http://localhost:9999/janedoe/lfsrepo"
```
Where `janedoe` is the user you created in the LFS server's web interface above and `lfsrepo` keeps track of where your large files for this repository should be stored on the server.
1. **Tell your git repositroy which files should be tracked with LFS**

  In your git repo, issue:
  ```
  git lfs track "*.psd"
  ```
This will use LFS to track any files ending in `.psd`
1. **[Optional] Stop the lfs-test-server instance**  

  ```
docker stop lfs
```
You can restart the container later with `docker start lfs`
1. **[Optional] Delete the lfs-test-server instance (after stopping it)**  

  ```
docker rm lfs
```
WARNING: this will delete anything stored inside the container
1. **Profit.**
