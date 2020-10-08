2020-05-22: Getting started for Sound Lab site using Hugo's Academic theme on github pages
------
To set up Hugo to deploy to github pages (i.e., SeismicSoundLab.github.io), we'll need to use 2 separate github repos that I've already created.

1) academic-kickstart.git (that we'll call My_Website locally) will hold all the content. This is where all the editing happens. Running "hugo -d public/" will generate the HTML files to My_Website/public/, but we will automate this in a shell script called My_website/deploy.sh later

2) SeismicSoundLab.github.io will hold only the html files that will be displayed on the live site. We will link this to My_Website/public/ so that pushing files in public will automatically sync to seismicsoundlab.github.io

------
## Initial Setup

Step 1 - download hugo using brew
brew install hugo

Step 2 - Clone academic-kickstart.git to a directory called My_Website:
git clone https://github.com/seismicsoundlab/academic-kickstart.git My_Website

Step 3 - Clone SeismicSoundLab.github.io:
git clone https://github.com/SeismicSoundLab/SeismicSoundLab.github.io.git

Step 4 - Next we want to sync My_Website/public/ with seismicsoundlab.github.io/ That way when we push to public, it will go to the github.io site. This is done using git submodules:
cd My_Website
git submodule add -b master https://github.com/SeismicSoundLab/SeismicSoundLab.github.io.git public
git commit -am "Add submodule public"

## Viewing site locally

If you want to view changes locally without pushing them to the full github.io site, run the shell script local.sh in My_Website. This will run "hugo server" starting a local server using your computer memory. Just navigate to http://localhost:1313/ in the browser and you should see the site. Changes made to files in My_Website will update in real time. Type CTRL+C to kill the server.

## Deploying to github.io

Once you're happy with the changes, run deploy.sh. This will run "hugo public/" and then add/commit/push all changes to public, and since we linked public to SeismicSoundLab.github.io as a git submodule, they will be pushed to the SeismicSoundLab.github.io site.

