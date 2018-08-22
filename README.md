## README for `ark_directories`

This is a set of scripts to create directories according to a list of ark identifiers specified in a CSV spreadsheet.  See [an example CSV manifest here](sample_manifest.csv), developed primarily for Mac users, but it can be run on any machine meeting the requirements below. 

## Requirements

* Ruby 2.3.0 or higher
* A CSV manifest specifying ark identifiers and the destination [absolute file path](https://www.computerhope.com/jargon/a/absopath.htm) at which the ark directory should be created.

## Usage

To create a set of directories that match the set of arks in a CSV manifest, open a [terminal window](http://blog.teamtreehouse.com/introduction-to-the-mac-os-x-command-line), type in the following, then press Enter:

```bash
./ark_directories.sh $CSV_MANIFEST
```

Where `$CSV_MANIFEST` is the path to the CSV manifest file described above.  Your new ark directories are then available at the destination directory specified in the CSV manifest.

## Usage explained

Alternative to using the bash script, you can execute this workflow manually.  Below is a more detailed explanation.

This workflow requires the use of two scripts.  The first one creates a set of machine-readable files known as [todo files](https://github.com/upenn-libraries/todo_runner) that the second script uses to create the ark directories. 

To create the todo files, execute the following command from the terminal:

```bash
ruby arkdirs_make_todos.rb $CSV_MANIFEST $TODOS_DESTINATION
```

Where `$CSV_MANIFEST` is the path to the CSV manifest file described above, and `$TODOS_DESTINATION` is the path on the filesystem where the script should write the todo files.

To then create directories, execute the following command from the terminal:

```bash
ruby arkdirs_generate_directories.rb $TODOS_DESTINATION/*.todo
```

Where `$TODOS_DESTINATION` matches the `$TODOS_DESTINATION` argument given in the first step.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/upenn-libraries/ark_directories](https://github.com/upenn-libraries/ark_directories).

## License

This code is available as open source under the terms of the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).
