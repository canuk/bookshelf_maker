# bookshelf_maker
Ruby script to generate a cool bookshelf-looking webpage for a directory of PDFs.

edit the variables in the `make_bookshelf.rb` file.

Then copy all these files into a directory that has a `/books` and a `/cover` directory

`/books` directory: has all the PDF files in it `[file_name].pdf`

`/covers` directory: has JPGs of the first page of the PDF file name format: `[file_name]_thumb.png` (129x166 dimensions)

they should have the same name as the PDF files and the suffix `_thumb`

A great utility for thumbnailing the first page of PDFs in a folder to png's is called ThumbsUp https://www.macupdate.com/app/mac/11898/thumbsup
