# Conjoint analysis Via HTML tables as iframes

This is a method of creating conjoint analysis tables for Qualtrics using R/Markdown, GitHub and a little bit of JavaScript.

## Step 1

Create the tables you want in R and export them as HTML using the `kable` package. Make sure you save the metadata (such as the order of the attributes if you decide to randomize it). 

## Step 2

Upload the HTML tables to your GitHub repo and publish the repo as a "page" so that the HTML tables can be embedded as iframes in Qualtrics.

## Step 3

Use embedded data and JavaScript to randomize which URL the respondent gets. This URL will link up a table in the GitHub repo. 
