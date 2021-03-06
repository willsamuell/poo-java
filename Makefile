all: slides html pdf

install:
	#Install bundler, that in turn downloads Ruby dependencies inside the Gemfile: http://bundler.io
	sudo gem install bundler -n /usr/local/bin
	#Asciidoctor Reveal.js Configurations
	bundle config --local github.https true
	bundle --path=.bundle/gems --binstubs=.bundle/.bin
	#Install build dependencies using Bundler
	bundler
	#Installs GitBook Client to make easier to generate
	#the book in HTML or PDF instead of using the asciidoctor tool.
	npm install gitbook-cli -g
	gitbook install
	
slides:
	#bundle exec asciidoctor-revealjs "slides.adoc" -o slides.html
	bundle exec asciidoctor-revealjs "chapter9-polimorfismo-p2.adoc" -o polimorfismo2.html

html:
	gitbook build ./ ./html

pdf:
	gitbook pdf ./ book.pdf

clean:
	rm -rf "html"
	rm -f book.pdf
	rm -f slides.html