import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scavenge_hunt/core/routes/app_navigation.dart';
import 'package:scavenge_hunt/core/constants/app_colors.dart';
import 'package:scavenge_hunt/core/constants/app_constants.dart';
import 'package:scavenge_hunt/core/constants/app_fonts.dart';
import 'package:scavenge_hunt/core/constants/app_images.dart';
import 'package:scavenge_hunt/core/constants/app_sizes.dart';
import 'package:scavenge_hunt/app.dart';
import 'package:scavenge_hunt/core/widgets/common_image_view_widget.dart';
import 'package:scavenge_hunt/core/widgets/custom_container_widget.dart';
import 'package:scavenge_hunt/core/widgets/my_text_widget.dart';

class ChatWithFriends extends StatefulWidget {
  const ChatWithFriends({super.key});

  @override
  State<ChatWithFriends> createState() => _ChatWithFriendsState();
}

class _ChatWithFriendsState extends State<ChatWithFriends> {
  final List<ChatMessage> _possibleReplies = [
    ChatMessage(
      name: 'Alice',
      message: 'Let’s go! I am excited.',
      isMe: false,
      imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
    ),
    ChatMessage(
      name: 'Bob',
      message: 'Ready when you are!',
      isMe: false,
      imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
    ),
    ChatMessage(
      name: 'Alice',
      message: 'Don’t forget to check the map.',
      isMe: false,
      imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
    ),
    ChatMessage(
      name: 'Bob',
      message: 'Who will win this time?',
      isMe: false,
      imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
    ),
    ChatMessage(
      name: 'Alice',
      message: 'Haha, good luck everyone!',
      isMe: false,
      imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
    ),
    ChatMessage(
      name: 'Bob',
      message: 'Let’s make it fun!',
      isMe: false,
      imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
    ),
  ];
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> messages = [
    ChatMessage(
      name: 'Alice',
      message: 'Hey, are you ready for the game?',
      isMe: false,
      imageUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
    ),
    ChatMessage(
      name: 'Me',
      message: 'Yes! Let’s start soon.',
      isMe: true,
      imageUrl: '',
    ),
    ChatMessage(
      name: 'Bob',
      message: 'I will join in 5 minutes.',
      isMe: false,
      imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
    ),
    ChatMessage(
      name: 'Me',
      message: 'Cool, waiting for you.',
      isMe: true,
      imageUrl: '',
    ),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      messages.add(
        ChatMessage(name: 'Me', message: text, isMe: true, imageUrl: ''),
      );
    });
    _textController.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    // Simulate a random reply after a short delay
    Future.delayed(const Duration(seconds: 1), () {
      final random = Random();
      final reply = _possibleReplies[random.nextInt(_possibleReplies.length)];
      setState(() {
        messages.add(reply);
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(95),
          child: ClipRRect(
            borderRadius: BorderRadius.zero,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                height: 95,
                alignment: Alignment.bottomCenter,
                padding: AppSizes.HORIZONTAL,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.zero,
                ),
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppNavigation.pop(context);
                        },
                        child: Image.asset(Assets.imagesArrowBack, height: 20),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.0, 0.5, 1.0],
                            colors: [
                              Color(0xFF28AE60),
                              Color(0xFFFFFF00),
                              Color(0xFFFFFFFF),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CommonImageView(
                            height: 35,
                            width: 35,
                            radius: 100,
                            fit: BoxFit.cover,
                            url: dummyImg,
                          ),
                        ),
                      ),
                      Expanded(
                        child: MyText(
                          text: 'Downtown Sprint',
                          paddingLeft: 12,
                          size: 16,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return msg.isMe
                      ? RightChatBubble(name: msg.name, message: msg.message)
                      : LeftChatBubble(
                          name: msg.name,
                          message: msg.message,
                          imageUrl: msg.imageUrl,
                        );
                },
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.zero,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: AppSizes.HORIZONTAL,
                  height: 100,
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(Assets.imagesEmoji, height: 28),
                          SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: kPrimaryColor,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: TextFormField(
                                controller: _textController,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor: kTertiaryColor,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: kTertiaryColor,
                                  fontFamily: AppFonts.Nunito,
                                  fontWeight: FontWeight.w500,
                                ),
                                onFieldSubmitted: (_) => _sendMessage(),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(
                                    0xff99BADD,
                                  ).withValues(alpha: 0.3),
                                  suffixIcon: GestureDetector(
                                    onTap: _sendMessage,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          Assets.imagesSend,
                                          height: 38,
                                        ),
                                      ],
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  hintText: 'Type a message...',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kTertiaryColor,
                                    fontFamily: AppFonts.Nunito,
                                  ),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String name;
  final String message;
  final bool isMe;
  final String imageUrl;

  ChatMessage({
    required this.name,
    required this.message,
    required this.isMe,
    required this.imageUrl,
  });
}

// Left chat bubble widget
class LeftChatBubble extends StatelessWidget {
  final String name;
  final String message;
  final String imageUrl;

  const LeftChatBubble({
    super.key,
    required this.name,
    required this.message,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonImageView(
              height: 36,
              width: 36,
              radius: 100,
              url: imageUrl,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff232323).withValues(alpha: 0.02),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kTertiaryColor.withValues(alpha: 0.05),
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: kPrimaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: kGreenColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(message, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Right chat bubble widget
class RightChatBubble extends StatelessWidget {
  final String name;
  final String message;

  const RightChatBubble({super.key, required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: kGreenColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 16, color: kPrimaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
