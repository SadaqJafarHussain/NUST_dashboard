class Ads {
  final String image;
  final String video;
  final String text;
  final String url;
  Ads({
   this.image='',
    this.text='',
    this.url='',
    this.video=''
});

  factory Ads.fromJson (Map <dynamic,dynamic> json,String urlFile)=>Ads(
    image:json["image_ads"].toString(),
    video:json["video_ads"].toString(),
    text:json["text_ads"].toString(),
    url:urlFile.toString(),
  );

}