
import 'package:flutter/material.dart';
import 'package:news/component/widgets/web.dart';

import '../Theme.dart';

SizedBox buildArticle(article,context) {
  return SizedBox(
    width: double.infinity,
    height: 120,
    child: InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>
          WebViewScreen(url: article['url'])));},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:  DecorationImage(
                    image: NetworkImage(
                        '${article['urlToImage']}'),
                    fit: BoxFit.cover)),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${article['title']}',
                    style: primaryStyle(context).copyWith(fontWeight: FontWeight.bold),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ))
        ],
      ),
    ),
  );
}
