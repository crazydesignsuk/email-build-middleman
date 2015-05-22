# Email Build with Middleman

##development

make sure you have ruby installed, along with [middleman](http://middlemanapp.com)

clone the directory and run ```bundle install``` before starting

run the middleman server using the ```middleman``` command, then access it at [http://localhost:4567](http://localhost:4567)

###layout & partials

Layouts (as in campaignmonitor layouts) are saved in ```partials/modules```

Make use of partials to keep the code easier to maintain and read


###styling

I'm using a *really stripped down* version of [ink](http://zurb.com/ink/) to set up defaults

Then any custom styles are in ```partials/_styleall.css.scss```. 

The style is actually loaded as a partial so that it puts the code directly into the head of the document, rather than linking to it.

This file is being passed as a Sass file, so you can make use of everything you normally would in Sass.

###inlining styles

To ensure everything works across all browsers its important to inline all the css. To do this I'm using [premailer](http://premailer.dialect.ca/).

Premailer is run on ```middleman build```. It outputs this into the build folder with ```-inline``` preprended to the file.

Although this is the preferred send format, do not upload this one to campaign monitor, as you'll need the styles in the head to overwrite wysiwyg styling