defmodule ElixirAlgorithms do
  @moduledoc """
  A collection of algorithms implemented in elixir.
  """

  def hello do
    text = """
    Coleridge has somewhere said that the Levitical economy is an enigma
    yet to be solved. To thousands of intelligent minds it is not only an
    enigma, but it is an absolute barrier to their belief in the Divine
    origin of the Bible. The solution of the enigma was the clue which
    aided the writer to escape from the labyrinth of doubt; and now,
    standing upon the rock of unshaken faith, he offers the clue that
    guided him to others.

    A work of this kind is called for by the spirit of the age. Although
    the signs of the times are said to be propitious, yet there are
    constant developments of undisciplined and unsanctified mind both in
    Europe and America, which furnishes matter of regret to the
    philanthropist and the Christian. A struggle has commenced--is going
    on at present; and the heat of the contest is constantly increasing,
    in which the vital interests of man, temporal and spiritual, are
    involved. In relation to man's spiritual interests, the central point
    of controversy is the 'cross of Christ.' In New England, some of those
    who have diverged from the doctrine of the fathers have wandered into
    a wilderness of speculation which, were it not for the evil
    experienced by themselves and others, ought, perhaps, to be pitied as
    the erratic aberrations of an unsettled reason, rather than blamed as
    the manifestations of minds determinately wicked. The most painful
    indication connected with this subject is, that these guilty dreamers
    are not waked from their reveries by the rebuke of men whose position
    and relations in society demand it at their hands.

    The west, likewise, is overrun by sects whose teachers, under the
    name of Reformers, or some other inviting appellation, are using every
    effort to seduce men from the spiritual doctrines and duties of the
    gospel, or to organize them into absolute hostility against Christ.
    These men are not wanting in intellect, or in acquired knowledge, and
    their labours have prejudiced the minds of great numbers against the
    spiritual truths of the gospel, and rendered their hearts callous to
    religious influence. These facts, in the author's opinion, render such
    a volume as he has endeavoured to write necessary, in order to meet
    the exigencies of the times.
    """

    BWT.transform(text) |> RLE.encode() |> RLE.decode() |> BWT.inverse()
  end
end
