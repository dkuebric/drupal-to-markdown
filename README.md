## How to convert docs from Drupal to Markdown (for eg. Jekyll)

1. Load the [DB dump from docs-appneta-com](https://github.com/appneta/docs-appneta-com/tree/master/mysqldump) into a locally-accessible DB.

2. Install some prereqs for Ruby & Jekyll:

    ```
    sudo apt-add-repository ppa:brightbox/ruby-ng
    sudo apt-get update
    sudo apt-get install ruby2.3 ruby2.3-dev

    # pick version of ruby
    sudo apt-get install ruby-switch
    sudo ruby-switch --set ruby2.3

    # gems
    sudo gem install jekyll
    sudo gem install sequel
    sudo gem install mysql
    ```

3. Load the patched jekyll-import (https://github.com/dkuebric/jekyll-import/pull/1)

    ```
    git clone git@github.com:dkuebric/jekyll-import.git
    git checkout docs-import
    rake build
    sudo rake install
    ```

4. Actually run the import to generate some docs:
    ```
    ruby import.rb
    ```

5. Run dos2unix on every file to clean up the line endings:
    ```
    find . -name "*.md" -exec dos2unix {} \;
    ```

6. There is at least one article where documentation on template tags confuses the template tag parser.  Find that doc (the one that's bombing, I think a python instrumentation doc) and wrap its markdown tags in `{% raw %} ... {% endraw %}`.
