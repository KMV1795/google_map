import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'colors.dart';

// User Stories Widget
Widget gridViewWidget(List list) {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: 105,
      child: GridView.builder(
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: list.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                margin: const EdgeInsets.only(top: 8,left: 08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 68,
                      height: 68,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: storyBorderColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            border: Border.all(color: black, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: const Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.add_a_photo_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                margin: const EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 68,
                      height: 68,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: storyBorderColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            border: Border.all(color: black, width: 2),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(list[index - 1]['img']),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        "${list[index - 1]['name']}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: white, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    ),
  );
}

// Home Page App Bar
Widget appBarWidget() {
  return SliverAppBar(
    pinned: true,
    backgroundColor: appBarColor,
    elevation: 0.0,
    centerTitle: false,
    title: const SizedBox(
      height: 35.0,
      child: Text(
        "Instagram",
        style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic),
      ),
    ),
    actions: [
      SvgPicture.asset(
        "assets/images/love_icon.svg",
        width: 25,
      ),
      const SizedBox(
        width: 15,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 05),
        child: SvgPicture.asset(
          "assets/images/message_icon.svg",
          width: 25,
        ),
      ),
    ],
  );
}

// User Location List
Widget userDetailList(List posts) {
  bool isLoved = true;
  TextEditingController controller = TextEditingController();
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              titleRow(posts[index]['profileImg'], posts[index]['name'],context),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(posts[index]['postImg']),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              // Comment Icons Row Widget
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        isLoved == true
                            ? SvgPicture.asset(
                                "assets/images/loved_icon.svg",
                                width: 27,
                              )
                            : SvgPicture.asset(
                                "assets/images/love_icon.svg",
                                width: 27,
                              ),
                        const SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset(
                          "assets/images/comment_icon.svg",
                          width: 27,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset(
                          "assets/images/message_icon.svg",
                          width: 27,
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      "assets/images/save_icon.svg",
                      width: 27,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Likes Count Widget
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "1900 likes",
                  style: TextStyle(
                      color: white.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Caption Widget
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "${posts[index]['caption']}",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                  ]))),
              const SizedBox(
                height: 12,
              ),
              // comments Count Widget
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "View ${posts[index]['commentCount']} comments",
                  style: TextStyle(
                      color: white.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Comments Input Widget
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        posts[index]['profileImg']),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SizedBox(
                            height: 30,
                            width: 200,
                            child: TextFormField(
                              controller: controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Add a comment.....",
                                hintStyle: TextStyle(
                                    color: white.withOpacity(0.5),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              style: TextStyle(
                                  color: white.withOpacity(0.5),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "${posts[index]['timeAgo']}",
                  style: TextStyle(
                      color: white.withOpacity(0.5),
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        );
      },
      childCount: posts.length, // 1000 list items
    ),
  );
}

// Widget Title Row
Widget titleRow(String profileImage, String name, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(profileImage), fit: BoxFit.cover)),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
                color: white, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        detailIcon(context),
      ],
    ),
  );
}

// Post Icon Details
Widget detailIcon(BuildContext context){
  return IconButton(
    icon:const Icon(Icons.more_vert),
    color: Colors.white,
    onPressed: () {
      showModalBottomSheet(
          context: context,
          builder:(context){
            return Container(
              height:300,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.black87,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(     // <-- TextButton
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 24.0,
                      color: Colors.white70,
                    ),
                    label: const Text('Add to Favourite',style: TextStyle(color: Colors.white70,),),
                  ),
                  TextButton.icon(     // <-- TextButton
                    onPressed: () {},
                    icon: const Icon(
                      Icons.save,
                      size: 24.0,
                      color: Colors.white70,
                    ),
                    label: const Text('Save to List',style: TextStyle(color: Colors.white70,),),
                  ),
                  const Divider(thickness: 1,color:Colors.white70,),
                  TextButton.icon(     // <-- TextButton
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      size: 24.0,
                      color: Colors.white70,
                    ),
                    label: const Text('Share the Post',style: TextStyle(color: Colors.white70,),),
                  ),
                  TextButton.icon(     // <-- TextButton
                    onPressed: () {},
                    icon: const Icon(
                      Icons.report,
                      size: 24.0,
                      color: Colors.white70,
                    ),
                    label: const Text('Report the post',style: TextStyle(color: Colors.white70,),),
                  ),
                  TextButton.icon(     // <-- TextButton
                    onPressed: () {},
                    icon: const Icon(
                      Icons.hide_source,
                      size: 24.0,
                      color: Colors.red,
                    ),
                    label: const Text('Hide Post',style: TextStyle(color: Colors.red,),),
                  ),
                ],
              ),
            );
          }
      );
    },
  );
}