# rseprac

## Solutions by M. Gouiza

### Problem 1

I have created a bash script to change the extension of files within a given directory.

#### Script:

```bash
# Check if the directory, old extension, and new extension are provided as arguments
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: $0 <directory> <old_extension> <new_extension>"
    exit 1
fi

# Directory, old extension, and new extension provided as arguments
dir=$1
old_ext=$2
new_ext=$3

# Check if the directory exists
if [ ! -d "$dir" ]; then
    echo "Directory $dir does not exist."
    exit 1
fi

# Change the old extension for all files in the directory to the new extension
for file in "$dir"/*."$old_ext"; do
    # Extract the base name without extension
    base=$(basename "$file" ."$old_ext")
    # change file extension
    mv "$file" "${dir}/${base}.${new_ext}"
done

# Print a message indicating completion
echo "Renamed all files with .$old_ext extension in $dir to have a .$new_ext extension."
```
#### Running the script:

1. Copy the script into a text file and save it with a `.sh` extension, e.g., `change_extension.sh`.

2. Open a terminal and navigate to the directory where you saved the script. 

3. Make the script executable by running the following command:
```
chmod +x change_extension.sh
```
4. To rename all files with a an old extension (e.g., `.csv`) in a directory to have a new extension (e.g., `.dat`), run the script with the directory, the old extension, and the new extension as arguments. 
e.g., If your files are in a directory called data_files and you want to change the extension from `.csv.` to `.dat` run:

```
./change_extension.sh data_files csv dat
```



### Problem 2

I have created a bash script that checks the files within a given directory. It counts the number of numerical values in each file and prints out on the screen the filenames and the number of values for the files that have fewer or more than 100 values.

#### Script

```bash
#!/bin/bash

# Directory where sample files are stored
directory="path_to_your_directory"

# Lists to store files with fewer than 100 values and more than 100 values
fewer_than_100_files=()
more_than_100_files=()

# Iterate through all files in the directory
for filepath in "$directory"/*; do
    if [ -f "$filepath" ]; then
        # Count the number of numerical values in the file
        value_count=$(tr -s '[:space:]' '\n' < "$filepath" | grep -E '^[0-9]+(\.[0-9]+)?$' | wc -l)
        
        # Check if the number of values is less than 100 or more than 100
        if [ "$value_count" -lt 100 ]; then
            fewer_than_100_files+=("$filepath: $value_count values")
        elif [ "$value_count" -gt 100 ]; then
            more_than_100_files+=("$filepath: $value_count values")
        fi
    fi
done

# Print the results
if [ ${#fewer_than_100_files[@]} -eq 0 ] && [ ${#more_than_100_files[@]} -eq 0 ]; then
    echo "All files have exactly 100 values."
else
    if [ ${#fewer_than_100_files[@]} -ne 0 ]; then
        echo "Files with fewer than 100 values:"
        for file in "${fewer_than_100_files[@]}"; do
            echo "$file"
        done
    fi

    if [ ${#more_than_100_files[@]} -ne 0 ]; then
        echo "Files with more than 100 values:"
        for file in "${more_than_100_files[@]}"; do
            echo "$file"
        done
    fi
fi
```

#### Running the script
1. Save the script to a file, e.g.: `check_nb_ values.sh`

2. Replace `path_to_your_directory` with the path to your directory containing the sample files.

3. Make the script executable:

```
chmod +x check_files.sh
```
4. Run the script:
```
./check_files.sh
```

### Problem 3

In order to investigate your Python code, there several aspects that you need to consider. Here are some general principles you can follow to assess your code and identify potential improvements:

**1. Profiling**
Profiling provides you with a breakdown of the time spent by the different components of your code. There various Python tools that you might want to use, e.g.:

- cProfile: is a built-in profiler that provides a detailed statistical analysis of how often and for how long each function is called.

- line_profiler: gives you a more detailed line-by-line execution times, revealing time-consuming portions within your functions. (You'll need to install it: `pip install line_profiler`)

- timeit: is a built-in memory profiler to track memory consumption over time and identify potential bottlenecks.

**2. Algorithmic Complexity: Big O Notation**

Understanding the algorithmic complexity (Big O notation) of your code can help you identify if your code has inefficient algorithms:

- Analyzing the structure of the code and estimate how the runtime scales with the input size (n).

- Identifying bottlenecks caused by nested loops, redundant calculations, or operations with high complexity.

**3. Optimization tips**

**Built-in functions** and libraries are usually better optimized for performance. Using NumPy for numerical operations, for instance, can be much faster than using pure Python.

**Avoid creating large lists** and use boolean arrays where True represents prime and False represents non-prime can reduce memory usage and speed up the code.

**Optimize array indexing** instead of a list to mark composite numbers. This can be more memory-efficient.

**Use generator expression** instead of list comprehension in your return statement, using a generator expression would be more memory-efficient.

**Reduced function calls** which contributes to the overall performance gain.

**Access local variables** directly instead of through function calls like.

**Consider parallel processing** to reduce computation time. 

### Problem 4

Regardless of the context, Requirements Analysis for data collection projects should assess project feasibility, aim to collect the right information in alignment with research goals, and ensure the ethical aspect.

Here are the key questions that I would ask and why:

**1. Project scope and objectives**

***Questions:*** What are the specific research questions you are trying to answer? What the main goal of your project?

***Why:*** This clarifies the goals driving data collection,  ensures that the data is adequate, informs analysis decisions.

***Questions:*** Who are the specific individuals you are interested in?  Are there specific groups or subgroups you want to focus on? how can you identify them?

***Why:*** Identifying these individuals (politicians, influencers, working class, education level, etc.) will determine which accounts to monitor.

***Questions:*** What is the time frame for data collection?

***Why:*** To determine the start/end dates of data collection and ensure that the length of the timeframe is relevant for the context.

***Questions:*** What types of data are relevant to your research? e.g., Original posts/tweets, comment/replies, engagement metrics (likes, shares, retweets, etc), metadata (timestamps, demographics, post reach, etc)

***Why:*** To ensure setting up appropriate data collection methods.

***Questions:*** What is the desired format for data delivery?

***Why:*** This will impact how the data is processed and analyzed.

**2. Technical and ethical considerations**

***Questions:*** Do you have access to any existing tools or APIs for data collection?

***Why:*** Twitter and Facebook have APIs, but there may be rate limits or restrictions. Other third-party tools might be available, but they might have costs involved.

***Questions:*** What is your budget for this project?

***Why:*** This will affect the tools and resources one can use.

***Questions:*** What are the ethical considerations for this research?

***Why:*** If personally identifiable information is collected, it is important to define how these will be handled. To ensure the consent from the individuals that are being monitoring. To determine if there any sensitive topics or potential biases that need to be addressed.

**3. Data analysis**

***Questions:*** What kind of analysis do you plan to conduct? Do you have specific tools or software in mind for data analysis?

**Why:*** This will help determine the necessary tools and expertise, and defining a suitable data collection method and format.

**4. Additional questions**

***Questions:*** What is your budget for this project? and what resources (in terms of personnel, software, hardware) are available to support this data collection?

**Why:*** Budget and resource are important for planning the scale and depth of the data collection.

***Questions:*** What are the expected deliverables and deadlines for this project?

**Why:*** This sets clear expectations for both of us.

***Questions:*** What challenges and limitations do you anticipate in collecting this data?

**Why:*** Identifying potential challenges and limitations early on allows for better planning and mitigation strategies.

***Questions:*** How and where will the collected data be stored, and what measures will you take to ensure its security?

**Why:*** Data storage and security are critical to protect sensitive information and ensure the integrity and availability of the data.

***Questions:*** Do you have any examples of similar research projects?

**Why:*** This can help understand the researcher expectations and define relevant methodologies.

### Problem 5

**(i) The content of the `fname_out` variable**

Let's break down how it is constructed:

- `Home` is variable that is not defined in the script fragment. But I guess it is a string likely holding the base directory path where the png files will be saved.

- `MetaData` is variable that concatenates the following information:

    - `VarName`: The fixed string "Ozone_"
    - `TimeStamp`: The date "2001-01-01", which is intended to be read from the NetCDF files.
    - `Frame`: The simulation hour formatted as a four-digit string (e.g., "0003" for hour 3)
- ".png" is the image file extension.

Based on the above, the content of the f`name_out `variable would be a string representing a file path and name for a PNG image. 

An example value for `fname_out` would look like:

```
/path/to/Home/Ozone_2001-01-01_0002.png
```

**(ii) Missing information**

The script fragment has a few issues and is missing some crucial information to run correctly:

- `TimeStamp` variable is currently hardcoded to "2001-01-01". The comment indicates that it should be read from the NetCDF files. This needs to be implemented to reflect the actual dates present in the ozone data.

- `simhour` is a variable that is not defined.

- `Home` is a variable that should be defined, probably as a string that stores the directory path where the PNG files should be saved.

- File name pattern mismatch: the NetCDF files have names like ozone_8dec2009.nc while the script currently generates filenames with a different date format (YYYY-MM-DD).

***Note: I could not access the Omniglobe webpage (https://arcscience.com/omniglobe-technology/)***