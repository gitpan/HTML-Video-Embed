use strict;
use warnings;

use Test::More;
use HTML::Video::Embed;

my $embeder = new HTML::Video::Embed({
    'width' => 450,
    'height' => 370,
});

is( $embeder->url_to_embed('http://www.dailymotion.com/video/xbrozz_the-worst-5-things-to-say-policemen_fun'),

    '<object width="450" height="370"><param name="movie" value="http://www.dailymotion.com/swf/video/xbrozz" /><param name="allowFullScreen" value="true" /><embed type="application/x-shockwave-flash" src="http://www.dailymotion.com/swf/video/xbrozz" width="450" height="370" allowfullscreen="true"></embed></object>',

    'dailymotion embed works'
);

is( $embeder->url_to_embed('http://www.dailymotion.com/videoxbrozz_the-worst-5-things-to-say-policemen_fun'), undef, 'invalid url');
is( $embeder->url_to_embed('http://www.dailymotion.com/video/_the-worst-5-things-to-say-policemen_fun'), undef, 'no video id');
is( $embeder->url_to_embed('http://www.da1lymotion.com/video/xbrozz_the-worst-5-things-to-say-policemen_fun'), undef, 'da1lymotion, not dailymotion');

done_testing;
