import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(20, (index) => UserStory(userName: 'User $index')),
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;
  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.blue.shade300,
                ),
                width: 80,
                height: 80,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: SvgPicture.network(
                    'https://avatars.legitgames.io/api/avatar?variant=beam&name=$userName',
                    fit: BoxFit.cover,
                    placeholderBuilder: (context) => CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedData{
  final String userName;
  final int likeCount;
  final String userProfileImage;
  final String content;

  const FeedData({
    required this.userName,
    required this.likeCount,
    required this.userProfileImage,
    required this.content,
  });
}

//mocking data
final feedDataList = [
  const FeedData(userName: 'User 0', likeCount: 50, userProfileImage: 'https://avatars.legitgames.io/api/avatar?variant=beam&name=User 0', content: 'This is a content. This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.'),
  const FeedData(userName: 'User 1', likeCount: 50, userProfileImage: 'https://avatars.legitgames.io/api/avatar?variant=beam&name=User 1', content: 'This is a content. This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.This is a content.'),
  const FeedData(userName: 'User 2', likeCount: 30, userProfileImage: 'https://avatars.legitgames.io/api/avatar?variant=beam&name=User 2', content: 'This is a content'),
  const FeedData(userName: 'User 3', likeCount: 20, userProfileImage: 'https://avatars.legitgames.io/api/avatar?variant=beam&name=User 3', content: 'This is a content'),
  const FeedData(userName: 'User 4', likeCount: 10, userProfileImage: 'https://avatars.legitgames.io/api/avatar?variant=beam&name=User 4', content: 'This is a content'),
  const FeedData(userName: 'User 5', likeCount: 120, userProfileImage: 'https://avatars.legitgames.io/api/avatar?variant=beam&name=User 5', content: 'This is a content'),
  const FeedData(userName: 'User 6', likeCount: 12, userProfileImage: 'https://avatars.legitgames.io/api/avatar?variant=beam&name=User 6', content: 'This is a content'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;
  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding (
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade300,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.network(
                        feedData.userProfileImage,
                        fit: BoxFit.cover,
                        placeholderBuilder: (context) => CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(feedData.userName),
                ],
              ),
              const Icon(Icons.more_vert)
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 380,
          color: Colors.blue.shade100,
          child: Image.network('https://picsum.photos/seed/picsum/400/400', fit: BoxFit.cover,),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),
                  IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.chat_bubble)),
                  IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.paperplane)),
                ],
              ),
              IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bookmark)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text('Liked ${feedData.likeCount}', style: TextStyle(fontWeight: FontWeight.bold),),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: RichText(text: TextSpan(
            children: [
              TextSpan(text: feedData.userName, style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: feedData.content),
            ],
            style: TextStyle(color: Colors.black),

          )),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

