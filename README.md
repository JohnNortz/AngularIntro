RAILS API using "Hoof" server.

Using the Code School API with Rails course, this is a rails based API for the serving of a Gemstone store application for the selling and cataloging of Gemstone products.
API allows for Getting, Posting, Editing, and Deleting products via API requests.

You can access GET requests by using the commands:
INDEX:         curl http://CodeSchoolAngular.dev/gemstones
Single Gem:    curl http://CodeSchoolAngular.dev/gemstone/[index number]

POST:
               curl -X POST -d 'gemstone[name]=PostingARock' http://CodeSchoolAngular.dev/gemstones

PATCH/PUT:
               curl -X PUT -d 'gemstone[name]=PuttsARock' http://CodeSchoolAngular.dev/gemstones/[Index Number]

DELETE:
               curl -X DELETE http://CodeSchoolAngular.dev/gemstones/[Index Number]

