# RedSocial Group 18

A Pinterest-inspired social network web application built with Ruby on Rails.  
Features secure authentication (Devise), role-based authorization (CanCanCan), and a modern, responsive UI with Bootstrap.

---
1. **Clone the repository**

git clone (https://github.com/ICC4103-202510-WebTech/group-project-group-18)
cd [Your folder with the repositorie]

2. **Install dependencies**

bundle install
yarn install

3. **Set up the database and seed demo data**

rails db:setup

4. **Start the Rails server**

rails server

**Go to http://localhost:3000 in your browser.**


**Test Users**
Email	              Password	Role
admin@admin.com	      admin123	Admin
usuario1@correo.com	   123456	User
usuario2@correo.com	   123456	User


**Roles & Permissions**

Admin:
- Can view and manage all users (/users).
- Full control over all posts, profiles, comments, and chats.
- Full access to the admin panel.

Regular User:
- Can create, edit, and delete their own posts and comments.
- Can edit their profile, view other users' profiles, and browse hashtags.
- Can initiate chats and send messages to allowed users.
- Cannot see or manage the global user administration.
- Permission logic is defined in app/models/ability.rb and enforced in controllers.

**Main Features**
- Authentication & password recovery with Devise.
- Role-based authorization with CanCanCan (see only what you can do).
- User-friendly forms & visual feedback (Bootstrap).
- Post listing with Pinterest-style cards.
- User profiles with edit and avatar/photo support.
- Chats and messages only accessible to participants.
- Access control: Unauthorized users get a friendly warning and a button to return to a safe page.