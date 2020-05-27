####Goals
#Download crawl data to S3 bucket
#Figure out the most popular sites

#Get the lists of crawl archives
aws s3 ls s3://commoncrawl/crawl-data/

#Get the latest one and rename it
curl -O https://commoncrawl.s3.amazonaws.com/crawl-data/CC-MAIN-2020-16/warc.paths.gz

#Unzip the file and keep the .gz file
gunzip -c warc.paths.gz
##output
#crawl-data/CC-MAIN-2020-16/segments/1585370490497.6/warc/CC-MAIN-20200328074047-20200328104047-00000.warc.gz

#search a url                                                         https://news.ycombinator.com
curl --silent 'http://index.commoncrawl.org/CC-MAIN-2017-04-index?url=https%3A%2F%2Fnews.ycombinator.com%2F*&output=json' \
>hn.paths
##output
#{"urlkey": "com,ycombinator,news)/,", "timestamp": "20170121175748", "status": "301", "mime": "text/html",
#"url": "http://news.ycombinator.com/,",
#"filename": "crawl-data/CC-MAIN-2017-04/segments/1484560281162.88/crawldiagnostics/CC-MAIN-20170116095121-00439-ip-10-171-10-70.ec2.internal.warc.gz",
# "length": "675", "digest": "QH732FYSV7UM34JYWVYMB7EZGR2CYM6B", "offset": "2118834"}

#save the result of a crawl to a file
#curl --silent 'http://index.commoncrawl.org/CC-MAIN-2017-04-index?url=https%3A%2F%2Fnews.ycombinator.com%2F*&output=json' > hn.paths
#base url for experimentation
curl --silent 'http://index.commoncrawl.org/CC-MAIN-2020-16-index?url=https%3A%2F%2Fgoogle.com%2F*&output=json' > google.paths
curl --silent 'http://index.commoncrawl.org/CC-MAIN-2020-16-index?url=https%3A%2F%2F
curl --silent 'http://index.commoncrawl.org/CC-MAIN-2020-16-index?url=https%3A%2F%2F

#download warc file for a certain page
curl -O https://commoncrawl.s3.amazonaws.com/crawl-data/CC-MAIN-2017-04/segments/1484560279657.18/warc/CC-MAIN-20170116095119-00156-ip-10-171-10-70.ec2.internal.warc.gz
head -c 822557378 CC-MAIN-20170116095119-00156-ip-10-171-10-70.ec2.internal.warc.gz \
    | tail -c 2049 \
    | gunzip -c
