# Ubiquiti Unifi Data Export Normalizer

The data that Unifi exports is conveniently human-readable but not readily
usable within common spreadsheet programs for non-technical users to consume.

This little ditty normalizes the data by

* converting session duration to minutes
* converting data transfer to megabytes

## Usage

    ruby bin/normalize-unifi.rb input.csv > output.csv

or install it as a gem and you can shorten it to simply `normalize-unifi`.

## Contributing

Ensure that all tests pass:

    rake

Develop using Guard:

    bundle exec guard
