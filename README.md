# geotrans-docker
An **unofficial** docker image for the GEOTRANS coordinate converter

# caveats
:warning: I have tried to find a docker image that most closely resembles the NGA-supported "RHEL 7, 64-bit, GCC 4.8.5." ([source](https://earth-info.nga.mil/GandG/update/index.php?action=home))
Therefore, this image is built on top of a CentOS 7 docker image.
This image also uses the GNU Compiler Collection (GCC) version 4.8.5.
That being said, I can't guarantee that the application will run the same on
this image as it would on a RHEL 7 Machine. Use at your own risk. 

:star: This image includes output files from the most recent tests, which you can find in /geotrans3.8/SpreadsheetTester/TestFiles/outputs/

# pull
```bash
docker pull geodesy/geotrans
```

# run
```bash
# run bash inside the container
docker run -it geodesy/geotrans bash
```

# further reading
- https://en.wikipedia.org/wiki/Geographic_coordinate_conversion
- https://en.wikipedia.org/wiki/Military_Grid_Reference_System
- https://earth-info.nga.mil/GandG/update/index.php?action=home
- https://sentinel.esa.int/web/sentinel/missions/sentinel-2/data-products
