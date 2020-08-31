module test_grapeql_ql

using Test
using GrapeQL

@ql {
  user(id: 4) {
    name
  }
}

@ql mutation {
  likeStory(storyID: 12345) {
    story {
      likeCount
    }
  }
}

@ql {
  field
}

@ql {
  id
  firstName
  lastName
}

@ql {
  me {
    id
    firstName
    lastName
    birthday {
      month
      day
    }
    friends {
      name
    }
  }
}

# `me` could represent the currently logged in viewer.
@ql { 
  me {
    name
  }
}

# `user` represents one of many users in a graph of data, referred to by a
# unique identifier.
@ql {
  user(id: 4) {
    name
  }
}

@ql {
  user(id: 4) {
    id
    name
    profilePic(size: 100)
  }
}

@ql {
  user(id: 4) {
    id
    name
    profilePic(width: 100, height: 50)
  }
}

@ql {
  picture(width: 200, height: 100)
}

@ql {
  picture(height: 100, width: 200)
}

@ql {
  user(id: 4) {
    id
    name
    smallPic: profilePic(size: 64)
    bigPic: profilePic(size: 1024)
  }
}

@ql {
  zuck: user(id: 4) {
    id
    name
  }
}

@ql query noFragments {
  user(id: 4) {
    friends(first: 10) {
      id
      name
      profilePic(size: 50)
    }
    mutualFriends(first: 10) {
      id
      name
      profilePic(size: 50)
    }
  }
}

@test true

end # module test_grapeql_ql
