copypasta = """I'd just like to interject for a moment. What you’re referring to as Linux, is in fact, GNU/Linux, or as I’ve recently taken to calling it, GNU plus Linux. Linux is not an operating system unto itself, but rather another free component of a fully functioning GNU system made useful by the GNU corelibs, shell utilities and vital system components comprising a full OS as defined by POSIX.

Many computer users run a modified version of the GNU system every day, without realizing it. Through a peculiar turn of events, the version of GNU which is widely used today is often called “Linux”, and many of its users are not aware that it is basically the GNU system, developed by the GNU Project. There really is a Linux, and these people are using it, but it is just a part of the system they use.

Linux is the kernel: the program in the system that allocates the machine’s resources to the other programs that you run. The kernel is an essential part of an operating system, but useless by itself; it can only function in the context of a complete operating system. Linux is normally used in combination with the GNU operating system: the whole system is basically GNU with Linux added, or GNU/Linux. All the so-called “Linux” distributions are really distributions of GNU/Linux.
"""

module.exports = (robot) ->
  robot.respond /.*linux.*/i, (res) ->
    # restrict to #ucf-lug
    return if res.message.room != 'ucf-lug' or res.message.match /gnu\/linux/i
 
    # only up to 5 GNU/Linuxes per day
    today = new Date().toDateString()
    gnuDay = robot.brain.get 'gnuDay' or today
    gnus = robot.brain.get 'gnus' or 0
    unless gnuDay == today and gnus >= 5
      gnus++
      res.send copypasta

    robot.brain.set 'gnuDay', today
    robot.brain.set 'gnus', gnus