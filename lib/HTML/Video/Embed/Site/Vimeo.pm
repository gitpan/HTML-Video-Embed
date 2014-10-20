package HTML::Video::Embed::Site::Vimeo;
use Moo;

with 'HTML::Video::Embed::Module';

our $VERSION = '0.016000';
$VERSION = eval $VERSION;

sub domain_reg {
    qr/vimeo\.com/;
}

sub process{
    my ( $self, $embeder, $uri ) = @_;

    my $schema = $embeder->secure ? 'https' : 'http';
    if ( my ( $vid ) = $uri->path =~ m|^(?:/m)?/(\d+)| ) {
        return qq|<iframe class="${ \$embeder->class }" src="${schema}://player.vimeo.com/video/${vid}" frameborder="0" allowfullscreen="1"></iframe>|;
    }

    return undef;
}

1;
