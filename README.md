# README

## Redlist

Redlist is a platform built upon Ruby on Rails framework to share stories or anything about life of a student.
The word "STUDENT" is indeed has a broad meaning. It comprises the meaning of lifelong, ongoing process.
Everyone of us is a student whether they have formal or informal education. We believe that
everyone have something to tell about their lessons learnt from life.

In addition to the broad meaning of the word "STUDENT" mentioned above,
Redlist also focusing on student of educational institution whether they are from schools,
matriculations, colleges, or universities. The platform has advertisement pages with five
categories which are part-time jobs, job huntings, events, promotions, and scholarships.
The group pages is where students or groups of people from research laboratories to create their own
webpages to introduce theirselves.

These are the categories that we thought are important for student's life.

We also encourage everyone to contribute and improve this platform.

## How to setup Redlist

Make sure you have Ruby version 2.3.3 and Rails version 5.

You can clone or download this repository, go to the directory and run the commands below:

```
$ bundle
$ rails db:migrate
$ rails db:seed
$ rails server
```
or by running a single shell script below
```
$ ./dbstart
```
## Future Works

- Full text search(elasticsearch)
- Only show reply comment form when clicking 'reply'
- Active record database query optimization
- Styling up css or maybe jquery too?
- Dynamic form: changing according to selected category
- Use AJAX for auto refresh
- Push notifications on browser and phone
- Favorite post to store for read later
- Feedback and suggestions form
- Add new categories if getting request from lot of users(require feedback form)
- Implement cache technologies(memcache or redis)
- Add calendar and auto marking for each post favourited
- Add google analytics
- Time localization on the form, but saving to database in UTC standard
- Jquery-bootsrap or drag-and-drop for file upload
- Category post scope for different type of user(ordinary user can only post on certain category)
- 'Story' category for blogging and sharing about student life(CKEditor and redesign 'views => show')
- Personal chat or direct message for private interaction
- Change 'promotion' category to 'trade' category => need redesign on 'views => show'(adding carousel for posted images, etc)
- Allow upvote comment and provide option to sort based on number of upvotes
- Add video upload processor and place the video if any
- Eliminate password validation on edit profile
- Create group pages that can be private or public
- Enable user to do simple image resize/crop before uploading
- create marker on the map for address location
- Any improvements are welcome

Feel free to send feedback to us.
