trigger sample  on Account (before insert) {
account a = trigger.new[0];
system.debug('@@@@'+a.id);

}