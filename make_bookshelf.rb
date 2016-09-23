# Bookshelf Maker
# Author: Reuben Thiessen, 2015
#
# Run this in a directory that has a /books and a /cover directory
# /books directory: has all the PDF files in it [file_name].pdf
# /covers directory: has JPGs of the first page of the PDF file name format: [file_name]_thumb.png (129x166 dimensions)
# they should have the same name as the PDF files and the suffix _thumb
# A great utility for thumbnailing the first page of PDFs in a folder to png's is called ThumbsUp https://www.macupdate.com/app/mac/11898/thumbsup
##########################################

# Change These
bookshelf_title = "PDF Bookshelf"
logo_image = "ck12.png"
pdf_directory = "books"

# Shouldn't need to change anything below

content = "<!DOCTYPE html>\n"
content += "<html>\n"
content += "<head>\n"
content += "<link rel=\"stylesheet\" href=\"bootstrap.min.css\">\n"
content += "<link rel=\"stylesheet\" href=\"bookshelf.css\">\n"
content += "<title>#{bookshelf_title}</title>\n"
content += "</head>\n"
content += "<body>\n"
content += "<br/>\n"
content += "<div class=\"container\" style=\"background-color: rgba(255, 255, 255, 0.5);border-radius:15px;\">\n"
unless logo_image == ""
  content += "<img align=\"right\" height=\"51\" src=\"#{logo_image}\"/>"
end
content += "<h1>#{bookshelf_title}</h1>\n"
content += "</div>\n"
content += "<div class=\"container\">\n"
content += "<div class=\"row\">\n"

a = 0
Dir.foreach("#{pdf_directory}") do |item|
  next if item == '.' or item == '..'
    a += 1
    content += "<div class=\"col-xs-4 col-md-2\">\n"
    content += "<a href=\"books/"+item[0..-5]+".pdf\">"
    content += "<img src=\"covers/"+item[0..-5]+"_thumb.png\" class=\"img-responsive book\"></a>\n"
    content += "</div>\n"
  if a  == 3
    content += "<div class=\"col-xs-12 shelf hidden-md hidden-lg\"></div>\n"
  elsif a == 6
    content += "<div class=\"col-xs-12 shelf\"></div>\n"
    a = 0
  end

end

content += "<div class=\"col-xs-12 shelf hidden-md hidden-lg\"></div>\n"
content += "<div class=\"col-xs-12 shelf hidden-xs hidden-sm\"></div>\n"
content += "</div>\n"
content += "</div>\n"
content += "<br/><br/>\n"
content += "</body>\n"
content += "</html>\n"

File.write('bookshelf.html', content)
