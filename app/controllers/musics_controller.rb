class MusicsController < InheritedResources::Base

  private

    def music_params
      params.require(:music).permit(:title, :artist, :available)
    end

end
