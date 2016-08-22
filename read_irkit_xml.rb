# coding: utf-8
require 'rexml/document'

if ARGV.size != 1
  puts "usage: ruby #{$0} aaa.xml"
  exit(1)
end

def xml_path
  ARGV[0]
end

raise "指定されたファイル[#{xml_path}]が見つかりません。" unless File.exist? xml_path

xml = ''
open(xml_path, 'r:utf-8') do |infile|
  xml = infile.read
end

doc = REXML::Document.new(xml)
doc.elements.each('//array/integer') do |e|
  print e.text + ', '
end

puts '【正常終了】'
