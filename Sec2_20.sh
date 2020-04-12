
#!/bin/bash/

# IFS variable

nameofcity="Mumbai Pune Nagpur"

echo $nameofcity

read -r city1 city2 city3 <<< $nameofcity

echo "city1 $city1"
echo "city2 $city2"
echo "city3 $city3"
