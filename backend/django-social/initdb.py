# Remove any existing database file first

import pathlib

pathlib.Path("./data/app.db").unlink(missing_ok=True)

# Create database and tables

from models import db, User, Msg, Token

db.connect()
db.create_tables([User, Msg, Token])

# Add sample data

users = [
    {"name": "Cole"},
    {"name": "Liz"},
    {"name": "Destiny"},
]

msgs = [
    {"user": "Cole", "message": "Hello world."},
    {"user": "Liz", "message": "Just checking in for the first time."},
    {
        "user": "Destiny",
        "message": "Nice place.",
        "replies": [
            {"user": "Cole", "message": "Dope"},
        ],
    },

]


def make_msg(msg, reply_to=None):
    new_msg = Msg.create(user=User.get(name=msg["user"]), message=msg["message"])

    if reply_to:
        new_msg.reply_to = reply_to
        new_msg.save()

    if "replies" in msg:
        for reply in msg["replies"]:
            make_msg(reply, new_msg)

    return new_msg


for user in users:
    new_user = User.create(**user)
    new_user.set_password(user.get("password", "vicious1998"))

for msg in msgs:
    new_msg = make_msg(msg)


# Display sample data

for msg in Msg.select():
    print(f'{msg.user.name}: "{msg.message}" {msg.reply_to}')
