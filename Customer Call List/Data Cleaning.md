A synthetic dataset of customer call list was cleaned in python.

```python
import pandas as pd
```


```python
df = pd.read_excel(r"C:\Users\Nahye\OneDrive - University of Toronto\Documents\Alex Analyst\Python_Pandas\Customer Call List.xlsx")
df.head(7)
```
<br />

Below is the first 7 rows of the dataset.

<br />

<div>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>CustomerID</th>
      <th>First_Name</th>
      <th>Last_Name</th>
      <th>Phone_Number</th>
      <th>Address</th>
      <th>Paying Customer</th>
      <th>Do_Not_Contact</th>
      <th>Not_Useful_Column</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1001</td>
      <td>Frodo</td>
      <td>Baggins</td>
      <td>123-545-5421</td>
      <td>123 Shire Lane, Shire</td>
      <td>Yes</td>
      <td>No</td>
      <td>True</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1002</td>
      <td>Abed</td>
      <td>Nadir</td>
      <td>123/643/9775</td>
      <td>93 West Main Street</td>
      <td>No</td>
      <td>Yes</td>
      <td>False</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1003</td>
      <td>Walter</td>
      <td>/White</td>
      <td>7066950392</td>
      <td>298 Drugs Driveway</td>
      <td>N</td>
      <td>NaN</td>
      <td>True</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1004</td>
      <td>Dwight</td>
      <td>Schrute</td>
      <td>123-543-2345</td>
      <td>980 Paper Avenue, Pennsylvania, 18503</td>
      <td>Yes</td>
      <td>Y</td>
      <td>True</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1005</td>
      <td>Jon</td>
      <td>Snow</td>
      <td>876|678|3469</td>
      <td>123 Dragons Road</td>
      <td>Y</td>
      <td>No</td>
      <td>True</td>
    </tr>
    <tr>
      <th>5</th>
      <td>1006</td>
      <td>Ron</td>
      <td>Swanson</td>
      <td>304-762-2467</td>
      <td>768 City Parkway</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>True</td>
    </tr>
    <tr>
      <th>6</th>
      <td>1007</td>
      <td>Jeff</td>
      <td>Winger</td>
      <td>NaN</td>
      <td>1209 South Street</td>
      <td>No</td>
      <td>No</td>
      <td>False</td>
    </tr>
  </tbody>
</table>
</div>

<br />

First, the columns and rows that do not give useful information about customers were removed.

```python
# Remove a duplicate row
df = df.drop_duplicates()
```


```python
# Delete a column
df = df.drop(columns = 'Not_Useful_Column')
```

Then, the column Last_Name was standardized to have only alphabets with the capitalized first letter.

```python
df['Last_Name'] = df['Last_Name'].str.strip('./_')
df.head(7)['Last_Name']
```


<br />

    0     Baggins
    1       Nadir
    2       White
    3     Schrute
    4        Snow
    5     Swanson
    6      Winger
    Name: Last_Name, dtype: object

<br />

Phone_Number was formatted like xxx-xxx-xxxx.
<br />
As the first step, any other characters than numbers or alphabets (for NaN) such as |, /, - were removed.

```python
# Remove anything other than alphabets(lower or upper)
df['Phone_Number'] = df['Phone_Number'].str.replace('[^a-zA-Z0-9]', '', regex = True)
df.head(7)['Phone_Number']
```

<br />


    0    1235455421
    1    1236439775
    2           NaN
    3    1235432345
    4    8766783469
    5    3047622467
    6           NaN
    Name: Phone_Number, dtype: object


<br />

The datatype of Phone_Number was converted to str and formatted to xxx-xxx-xxxx.

```python
# Convert all entries to str
df['Phone_Number'] = df['Phone_Number'].apply(lambda x: str(x))

# Formatting like xxx-xxx-xxxx
df['Phone_Number'] = df['Phone_Number'].apply(lambda x: x[0:3] + '-' + x[3:6] + '-' + x[6:10])
df.head(7)['Phone_Number']
```

<br />


    0    123-545-5421
    1    123-643-9775
    2           nan--
    3    123-543-2345
    4    876-678-3469
    5    304-762-2467
    6           nan--
    Name: Phone_Number, dtype: object

<br />

Na's were replaced with blank as the last step for cleaning Phone_Number.
```python
# Replace Na with blank
df['Phone_Number'] = df['Phone_Number'].str.replace('nan--', '')
df['Phone_Number'] = df['Phone_Number'].str.replace('Na--', '')
df.head(7)['Phone_Number']
```


<br />

    0    123-545-5421
    1    123-643-9775
    2                
    3    123-543-2345
    4    876-678-3469
    5    304-762-2467
    6                
    Name: Phone_Number, dtype: object


<br />

The entries in the column Address contain one or more of street address, state and zip code. I separted Address into three sub-addresses aoccordingly for better readability.

```python
# Create Street_Address, State and Zip_Code with the split address and append
df[['Street_Address', 'State', 'Zip_Code']] = df['Address'].str.split(',', expand = True)

# Drop the column Address (old address form)
df = df.drop(columns = 'Address')

df.head(7)
```




<div>
<br />
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>CustomerID</th>
      <th>First_Name</th>
      <th>Last_Name</th>
      <th>Phone_Number</th>
      <th>Paying Customer</th>
      <th>Do_Not_Contact</th>
      <th>Street_Address</th>
      <th>State</th>
      <th>Zip_Code</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1001</td>
      <td>Frodo</td>
      <td>Baggins</td>
      <td>123-545-5421</td>
      <td>Yes</td>
      <td>No</td>
      <td>123 Shire Lane</td>
      <td>Shire</td>
      <td>None</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1002</td>
      <td>Abed</td>
      <td>Nadir</td>
      <td>123-643-9775</td>
      <td>No</td>
      <td>Yes</td>
      <td>93 West Main Street</td>
      <td>None</td>
      <td>None</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1003</td>
      <td>Walter</td>
      <td>White</td>
      <td></td>
      <td>N</td>
      <td>NaN</td>
      <td>298 Drugs Driveway</td>
      <td>None</td>
      <td>None</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1004</td>
      <td>Dwight</td>
      <td>Schrute</td>
      <td>123-543-2345</td>
      <td>Yes</td>
      <td>Y</td>
      <td>980 Paper Avenue</td>
      <td>Pennsylvania</td>
      <td>18503</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1005</td>
      <td>Jon</td>
      <td>Snow</td>
      <td>876-678-3469</td>
      <td>Y</td>
      <td>No</td>
      <td>123 Dragons Road</td>
      <td>None</td>
      <td>None</td>
    </tr>
    <tr>
      <th>5</th>
      <td>1006</td>
      <td>Ron</td>
      <td>Swanson</td>
      <td>304-762-2467</td>
      <td>Yes</td>
      <td>Yes</td>
      <td>768 City Parkway</td>
      <td>None</td>
      <td>None</td>
    </tr>
    <tr>
      <th>6</th>
      <td>1007</td>
      <td>Jeff</td>
      <td>Winger</td>
      <td></td>
      <td>No</td>
      <td>No</td>
      <td>1209 South Street</td>
      <td>None</td>
      <td>None</td>
    </tr>
  </tbody>
</table>
</div>

<br />

After standardizing Paying Customer to Y for Yes and N for No and converting Na to blank in Do_Not_Contact,
all rows with blank for Phone_Number or Y for Do_Not_Contact were removed since the contact to those customers cannot be made.
```python
# Standardize Paying Customer to Y and N

df['Paying Customer'] = df['Paying Customer'].str.replace('Yes', 'Y')
df['Paying Customer'] = df['Paying Customer'].str.replace('No', 'N')
df['Do_Not_Contact'] = df['Do_Not_Contact'].str.replace('Yes', 'Y')
df['Do_Not_Contact'] = df['Do_Not_Contact'].str.replace('No', 'N')
df[['Paying Customer', 'Do_Not_Contact']].head(7)
```

<br />


<div>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Paying Customer</th>
      <th>Do_Not_Contact</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Y</td>
      <td>N</td>
    </tr>
    <tr>
      <th>1</th>
      <td>N</td>
      <td>Y</td>
    </tr>
    <tr>
      <th>2</th>
      <td>N</td>
      <td>NaN</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Y</td>
      <td>Y</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Y</td>
      <td>N</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Y</td>
      <td>Y</td>
    </tr>
    <tr>
      <th>6</th>
      <td>N</td>
      <td>N</td>
    </tr>
  </tbody>
</table>
</div>

<br />


```python
# Remove all N/a and NA from the DataFrame
df = df.replace('N/a', '')
df = df.fillna('')
df.head(7)
```


<br />

<div>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>CustomerID</th>
      <th>First_Name</th>
      <th>Last_Name</th>
      <th>Phone_Number</th>
      <th>Paying Customer</th>
      <th>Do_Not_Contact</th>
      <th>Street_Address</th>
      <th>State</th>
      <th>Zip_Code</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1001</td>
      <td>Frodo</td>
      <td>Baggins</td>
      <td>123-545-5421</td>
      <td>Y</td>
      <td>N</td>
      <td>123 Shire Lane</td>
      <td>Shire</td>
      <td></td>
    </tr>
    <tr>
      <th>1</th>
      <td>1002</td>
      <td>Abed</td>
      <td>Nadir</td>
      <td>123-643-9775</td>
      <td>N</td>
      <td>Y</td>
      <td>93 West Main Street</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>2</th>
      <td>1003</td>
      <td>Walter</td>
      <td>White</td>
      <td></td>
      <td>N</td>
      <td></td>
      <td>298 Drugs Driveway</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>3</th>
      <td>1004</td>
      <td>Dwight</td>
      <td>Schrute</td>
      <td>123-543-2345</td>
      <td>Y</td>
      <td>Y</td>
      <td>980 Paper Avenue</td>
      <td>Pennsylvania</td>
      <td>18503</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1005</td>
      <td>Jon</td>
      <td>Snow</td>
      <td>876-678-3469</td>
      <td>Y</td>
      <td>N</td>
      <td>123 Dragons Road</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>5</th>
      <td>1006</td>
      <td>Ron</td>
      <td>Swanson</td>
      <td>304-762-2467</td>
      <td>Y</td>
      <td>Y</td>
      <td>768 City Parkway</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>6</th>
      <td>1007</td>
      <td>Jeff</td>
      <td>Winger</td>
      <td></td>
      <td>N</td>
      <td>N</td>
      <td>1209 South Street</td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>

<br />


```python
# Remove Blank Phone_Number and Y for Do_Not_Contact

for x in df.index:
    if df.loc[x, 'Do_Not_Contact'] == 'Y' or df.loc[x, 'Phone_Number'] == '':
        df.drop(x, inplace = True)

df
```

<br />

Below shows the dataframe cleaned so far.

<div>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>CustomerID</th>
      <th>First_Name</th>
      <th>Last_Name</th>
      <th>Phone_Number</th>
      <th>Paying Customer</th>
      <th>Do_Not_Contact</th>
      <th>Street_Address</th>
      <th>State</th>
      <th>Zip_Code</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1001</td>
      <td>Frodo</td>
      <td>Baggins</td>
      <td>123-545-5421</td>
      <td>Y</td>
      <td>N</td>
      <td>123 Shire Lane</td>
      <td>Shire</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>1005</td>
      <td>Jon</td>
      <td>Snow</td>
      <td>876-678-3469</td>
      <td>Y</td>
      <td>N</td>
      <td>123 Dragons Road</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>7</th>
      <td>1008</td>
      <td>Sherlock</td>
      <td>Holmes</td>
      <td>876-678-3469</td>
      <td>N</td>
      <td>N</td>
      <td>98 Clue Drive</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>9</th>
      <td>1010</td>
      <td>Peter</td>
      <td>Parker</td>
      <td>123-545-5421</td>
      <td>Y</td>
      <td>N</td>
      <td>25th Main Street</td>
      <td>New York</td>
      <td></td>
    </tr>
    <tr>
      <th>12</th>
      <td>1013</td>
      <td>Don</td>
      <td>Draper</td>
      <td>123-543-2345</td>
      <td>Y</td>
      <td>N</td>
      <td>2039 Main Street</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>13</th>
      <td>1014</td>
      <td>Leslie</td>
      <td>Knope</td>
      <td>876-678-3469</td>
      <td>Y</td>
      <td>N</td>
      <td>343 City Parkway</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>14</th>
      <td>1015</td>
      <td>Toby</td>
      <td>Flenderson</td>
      <td>304-762-2467</td>
      <td>N</td>
      <td>N</td>
      <td>214 HR Avenue</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>15</th>
      <td>1016</td>
      <td>Ron</td>
      <td>Weasley</td>
      <td>123-545-5421</td>
      <td>N</td>
      <td>N</td>
      <td>2395 Hogwarts Avenue</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>16</th>
      <td>1017</td>
      <td>Michael</td>
      <td>Scott</td>
      <td>123-643-9775</td>
      <td>Y</td>
      <td>N</td>
      <td>121 Paper Avenue</td>
      <td>Pennsylvania</td>
      <td></td>
    </tr>
    <tr>
      <th>19</th>
      <td>1020</td>
      <td>Anakin</td>
      <td>Skywalker</td>
      <td>876-678-3469</td>
      <td>Y</td>
      <td>N</td>
      <td>910 Tatooine Road</td>
      <td>Tatooine</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>




```python
# Re-assign index.
df = df.reset_index(drop = True)
df
```

<br />

As the final step, the index was reassigned so that it increases by 1 each row from 0

<div>
<br />
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>CustomerID</th>
      <th>First_Name</th>
      <th>Last_Name</th>
      <th>Phone_Number</th>
      <th>Paying Customer</th>
      <th>Do_Not_Contact</th>
      <th>Street_Address</th>
      <th>State</th>
      <th>Zip_Code</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1001</td>
      <td>Frodo</td>
      <td>Baggins</td>
      <td>123-545-5421</td>
      <td>Y</td>
      <td>N</td>
      <td>123 Shire Lane</td>
      <td>Shire</td>
      <td></td>
    </tr>
    <tr>
      <th>1</th>
      <td>1005</td>
      <td>Jon</td>
      <td>Snow</td>
      <td>876-678-3469</td>
      <td>Y</td>
      <td>N</td>
      <td>123 Dragons Road</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>2</th>
      <td>1008</td>
      <td>Sherlock</td>
      <td>Holmes</td>
      <td>876-678-3469</td>
      <td>N</td>
      <td>N</td>
      <td>98 Clue Drive</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>3</th>
      <td>1010</td>
      <td>Peter</td>
      <td>Parker</td>
      <td>123-545-5421</td>
      <td>Y</td>
      <td>N</td>
      <td>25th Main Street</td>
      <td>New York</td>
      <td></td>
    </tr>
    <tr>
      <th>4</th>
      <td>1013</td>
      <td>Don</td>
      <td>Draper</td>
      <td>123-543-2345</td>
      <td>Y</td>
      <td>N</td>
      <td>2039 Main Street</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>5</th>
      <td>1014</td>
      <td>Leslie</td>
      <td>Knope</td>
      <td>876-678-3469</td>
      <td>Y</td>
      <td>N</td>
      <td>343 City Parkway</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>6</th>
      <td>1015</td>
      <td>Toby</td>
      <td>Flenderson</td>
      <td>304-762-2467</td>
      <td>N</td>
      <td>N</td>
      <td>214 HR Avenue</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>7</th>
      <td>1016</td>
      <td>Ron</td>
      <td>Weasley</td>
      <td>123-545-5421</td>
      <td>N</td>
      <td>N</td>
      <td>2395 Hogwarts Avenue</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <th>8</th>
      <td>1017</td>
      <td>Michael</td>
      <td>Scott</td>
      <td>123-643-9775</td>
      <td>Y</td>
      <td>N</td>
      <td>121 Paper Avenue</td>
      <td>Pennsylvania</td>
      <td></td>
    </tr>
    <tr>
      <th>9</th>
      <td>1020</td>
      <td>Anakin</td>
      <td>Skywalker</td>
      <td>876-678-3469</td>
      <td>Y</td>
      <td>N</td>
      <td>910 Tatooine Road</td>
      <td>Tatooine</td>
      <td></td>
    </tr>
  </tbody>
</table>
</div>


