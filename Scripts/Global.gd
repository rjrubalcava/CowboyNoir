extends Node2D


var m_parent

# Dialogue vars
@onready var dialogueBox = preload("res://Scenes/DialogueBox.tscn")
@onready var dialogueOption = preload("res://Scenes/DialogueOption.tscn")
var character_dialogue_dict = {}
var player_dialogue_dict = {}
var current_prompt = null
var current_options = []
var character = "amity"

var clubcardclick=false
var hourhandclick = false
var heartcardclick=false
var minutecardclick=false
var spadecardclick = false
var diamondcardclick = false
var puzzlesolved = false
var bluffCompleted = false
var BHTransition = false
var HeadspaceSong 
var clockDong 
# Called when the node enters the scene tree for the first time.
func _ready():
	HeadspaceSong = get_node("HeadspaceMusicStart")
	clockDong = get_node("clockDong")

func newNode(node, location, parent, scaleMult):
	var newNode = node.instantiate()
	parent.add_child(newNode)
	newNode.global_position = location
	newNode.scale *= scaleMult
	return newNode

func init_dialogue():
	if character ==  "amity":
		###### AMITY ######
		### stage 1 ###
		# Tree 1:
		character_dialogue_dict["111a"] = ["Hello Jack. It's nice to meet you.", ["111a", "111b"], []]
		character_dialogue_dict["112a"] = ["We have?", ["112a", "112b"], []]
		character_dialogue_dict["112b"] = ["You remember how to play?", ["112c", "112d"], []]
		### stage 2 ###
		# Tree 1:
		character_dialogue_dict["211a"] = ["Are you gonna tell me why you're here, detective?", ["211a", "211b"], []]
		character_dialogue_dict["212a"] = ["I want to hear it from you.", ["212a", "212b"], []]
		character_dialogue_dict["212b"] = ["Funny, didn't think you ever respected Iris.", ["212c", "212d"], []]
		# Tree 2:
		character_dialogue_dict["221a"] = ["Did you ever play with Iris?", ["221a", "221b"], []]
		character_dialogue_dict["222a"] = ["Figures.", ["222a", "222b"], []]
		character_dialogue_dict["222b"] = ["Hmm ... different time.", ["222c", "222d"], []]
		### stage 3 ###
		# Tree 1:
		character_dialogue_dict["311a"] = ["Enlighten me.", ["311a", "311b"], []]
		character_dialogue_dict["312a"] = ["Sorry, I must've confused 'respect' with misguided vendetta.", ["312a", "312b"], []]
		character_dialogue_dict["312b"] = ["You've been practically strangers for 15 years.", ["312c", "312d"], []]
		# Tree 2:
		character_dialogue_dict["321a"] = ["Me too ...", ["321a", "321b"], []]
		character_dialogue_dict["322a"] = ["Why should I?", ["322a", "322b"], []]
		character_dialogue_dict["322b"] = ["Do you have any other options?", ["322c", "322d"], []]
		# Tree 3:
		character_dialogue_dict["331a"] = ["How dare you?", ["331a", "331b"], []]
		character_dialogue_dict["332a"] = ["I'm not gonna let you interrogate me.", ["332a", "332b"], []]
		character_dialogue_dict["332b"] = ["Nothing, other than he's in charge now.", ["332c", "332d"], []]
		### stage 4 ###
		# Tree 1:
		character_dialogue_dict["411a"] = ["What does Peter have to do with this?", ["411a", "411b"], []]
		character_dialogue_dict["412a"] = ["There's no one you can trust.", ["412a", "412b"], []]
		character_dialogue_dict["412b"] = ["He's going to get himself killed.", ["412c", "412d"], []]
		# Tree 2:
		character_dialogue_dict["421a"] = ["She didn't have a choice.", ["421a", "421b"], []]
		character_dialogue_dict["422a"] = ["Stan was also her family. She couldn't throw that away as easy as you.", ["422a", "422b"], []]
		character_dialogue_dict["422b"] = ["And you do?", ["422c", "422d"], []]
		# Tree 3:
		character_dialogue_dict["431a"] = ["Doesn't matter anymore. You're too late.", ["431a", "431b"], []]
		character_dialogue_dict["432a"] = ["Well, don't say I didn't warn you.", ["432a", "432b"], []]
		character_dialogue_dict["432b"] = ["I don't [i]need[/i] to do anything.", ["432c", "432d"], []]
		# Tree 4:
		character_dialogue_dict["441a"] = ["You really have no idea what you're doing.", ["441a", "441b"], []]
		character_dialogue_dict["442a"] = ["Neither was Iris, and you didn't care.", ["442a", "442b"], []]
		character_dialogue_dict["442b"] = ["You've already proven me right.", ["442c", "442d"], []]
		### stage 5 ###
		# Tree 1:
		character_dialogue_dict["511a"] = ["I love Peter and I know he'll never put himself at risk.", ["511a", "511b"], []]
		character_dialogue_dict["512a"] = ["I'm at risk just talking to you.", ["512a", "512b"], []]
		character_dialogue_dict["512b"] = ["Exactly. So you know he's not stupid enough to talk to you.", ["512c", "512d"], []]
		# Tree 2:
		character_dialogue_dict["521a"] = ["I don't need to clear my name.", ["521a", "521b"], []]
		character_dialogue_dict["522a"] = ["I've said enough already.", ["522a", "522b"], []]
		character_dialogue_dict["522b"] = ["I'm not stupid.", ["522c", "522d"], []]
		# Tree 3:
		character_dialogue_dict["531a"] = ["I don't need your protection.", ["531a", "531b"], []]
		character_dialogue_dict["532a"] = ["What are you implying?", ["532a", "532b"], []]
		character_dialogue_dict["532b"] = ["They have no reason to come after me.", ["532c", "532d"], []]
		# Tree 4:
		character_dialogue_dict["541aa"] = ["You know, you also had a choice. You could have helped her when she came to you.", ["541a", "541b"], []]
		character_dialogue_dict["541ab"] = ["You should have [i]wanted[/i] to help Iris when she came to you.", ["541a", "541b"], []]
		character_dialogue_dict["541ac"] = ["She called you because she needed you, and you left her to die.", ["541a", "541b"], []]
		character_dialogue_dict["542a"] = ["She told me she called you.", ["542a", "542b"], []]
		character_dialogue_dict["542b"] = ["You could have saved her.", ["542c", "542d"], []]
		### stage 6 ###
		# Tree 1:
		character_dialogue_dict["611a"] = ["We're going in circles, detective.", ["611a", "611b"], []]
		character_dialogue_dict["612a"] = ["Choose your next words carefully.", ["612a", "612b"], []]
		character_dialogue_dict["612b"] = ["No, but someone was planning a hit. I'm sure you can figure out who.", ["612c", "612d"], []]
		# Tree 2:
		character_dialogue_dict["621a"] = ["You're so naive.", ["621a", "621b"], []]
		character_dialogue_dict["622a"] = ["You don't know me.", ["622a", "622b"], []]
		character_dialogue_dict["622b"] = ["How do you figure that?", ["622c", "622d"], []]
		# Tree 3:
		character_dialogue_dict["631a"] = ["It's not worth it, detective. You can't fix things anymore. Just got home.", ["631a", "631b"], []]
		character_dialogue_dict["632a"] = ["Coming here wasn't an option either.", ["632a", "632b"], []]
		character_dialogue_dict["632b"] = ["I know what you did. You're pathetic, coming here.", ["632c", "632d"], []]
		# Tree 4:
		character_dialogue_dict["641a"] = ["I don't need protection because I can handle myself.", ["641a", "641b"], []]
		character_dialogue_dict["642b"] = ["...", ["642c"], []]
		# Tree 5:
		character_dialogue_dict["651a"] = ["How dare you ask me that?", ["651a", "651b"], []]
		character_dialogue_dict["652a"] = ["No! I would never take a bribe for Iris' life.", ["652a", "652b"], []]
		character_dialogue_dict["652b"] = ["I would never accept a bribe for Iris' life.", ["652c", "652d"], []]
		# Tree 6:
		character_dialogue_dict["661a"] = ["What are you talking about?", ["661a", "661b"], []]
		character_dialogue_dict["662a"] = ["Of course she talked to me, she was worried about Boone!", ["662a", "662b"], []]
		character_dialogue_dict["662b"] = ["I have nothing to hide! Iris was worried about Boone and you didn't help her.", ["662c", "662d"], []]
		# Tree 7:
		character_dialogue_dict["671a"] = ["She didn't say anything else. She was scared.", ["671a", "671b"], []]
		character_dialogue_dict["672a"] = ["Yes. That was our last conversation, so I think I'd remember.", ["672a", "672b"], []]
		character_dialogue_dict["672b"] = ["She said something about Boone.", ["672c", "672d"], []]
		### stage 7 ###
		# Tree 1:
		character_dialogue_dict["711a"] = ["There is. Just think about it. There's only one other person you know for sure didn't do it.", ["711a", "711b"], []]
		character_dialogue_dict["712a"] = ["Exactly. He practically raised you two. Iris was on the phone with someone before she died, who else would she have called?", ["712a", "712b"], []]
		character_dialogue_dict["712b"] = ["Exactly. Start with them, Peter has dirt on everyone. If anyone knows something, it's him.", ["712c", "712d"], []]
		character_dialogue_dict["713a"] = ["When I found her she hadn't even hung up the phone yet. I guarantee Stan was on the other end.", ["713a", "711b"], []]
		character_dialogue_dict["713b"] = ["I didn't see her at all that day. I did call her though, but she didn't answer. That's when I went over.", ["712a", "712b"], []]
		character_dialogue_dict["713c"] = ["What now?", ["713c"], []]
		character_dialogue_dict["714a"] = ["Nothing ...", ["714a"], []]
		character_dialogue_dict["714b"] = ["How?", ["714b"], []]
		# Tree 2:
		character_dialogue_dict["721a"] = ["Everyone makes mistakes. Let's make it right.", ["721a", "721b"], []]
		character_dialogue_dict["722a"] = ["It doesn't matter. Listen, someone was planning something. Someone who wasn't very happy with being number 2 ...", ["722a", "722b"], []]
		character_dialogue_dict["722b"] = ["You notice anything weird about Peter when you came in?", ["722c", "722d"], []]
		character_dialogue_dict["723a"] = ["Seems logical to me. Who else had motive to kill Iris?", ["723a", "723b"], []]
		character_dialogue_dict["723b"] = ["So is Stan. Been acting weird all week, even before Iris died. If I was you, I'd start with those two.", ["723c", "723d"], []]
		character_dialogue_dict["723c"] = ["He's the first person I called when I found Iris. He didn't sound surprised when I gave him the news.", ["723e", "723f"], []]
		# Tree 3:
		character_dialogue_dict["731a"] = ["Fine. It sounds to me like someone was planning something.", ["731a", "731b"], []]
		character_dialogue_dict["732a"] = ["Stan has been acting weird lately. I'd start with him.", ["732a", "732b"], []]
		character_dialogue_dict["732b"] = ["I know what you did. You're pathetic, coming here.", ["732c", "732d"], []]
		character_dialogue_dict["733a"] = ["I'd talk to Peter, he always seems to know something.", ["733a", "733b"], []]
		# Tree 4:
		character_dialogue_dict["741a"] = ["Like what?!", ["741a", "741b"], []]
		character_dialogue_dict["742a"] = ["I didn't see her at all that day. When I called her that night she didn't answer, so I stopped by at her place.", ["742a", "742b"], []]
		character_dialogue_dict["742b"] = ["I found her body and a half packed suitcase.", ["742c", "742d"], []]
		character_dialogue_dict["743a"] = ["Peter always seems to know something.", ["743a", "743b"], []]
		character_dialogue_dict["743b"] = ["I don't know anything about that.", ["743c", "743d"], []]
		character_dialogue_dict["744a"] = ["She didn't tell me, which means she was going to leave me here.", ["744a"], []]
		character_dialogue_dict["744b"] = ["Something really spooked her ...", ["744b"], []]
		# Tree 5:
		character_dialogue_dict["751a"] = ["I don't need protection because I can handle myself.", ["751a", "751b"], []]
		character_dialogue_dict["752a"] = ["...", ["752a", "752b"], []]
		# Tree 6:
		character_dialogue_dict["761a"] = ["Me?!", ["761a", "761b"], []]
		character_dialogue_dict["762a"] = ["I have no idea what you're talking about.", ["762a", "762b"], []]
		character_dialogue_dict["762b"] = ["What kind of fucking question is that?!", ["762c", "762d"], []]
		character_dialogue_dict["763a"] = ["How do I do that?", ["763a"], []]
		character_dialogue_dict["763b"] = ["How do I do that?", ["763b"], []]
		# Tree 7:
		character_dialogue_dict["771a"] = ["He was sick of being the number two guy. He was planning something.", ["771a", "771b"], []]
		character_dialogue_dict["772a"] = ["What do I have to do for you to believe me?", ["772a", "772b"], []]
		character_dialogue_dict["772b"] = ["I don't know much. You should talk to Stan, though.", ["772c", "772d"], []]
		character_dialogue_dict["773a"] = ["Yes ... will you leave me alone now?", ["773a"], []]
		character_dialogue_dict["773b"] = ["What?", ["773b"], []]
		character_dialogue_dict["774a"] = ["What?", ["774a"], []]
		# Tree 8:
		character_dialogue_dict["781a"] = ["I left.", ["781a", "781b"], []]
		character_dialogue_dict["782a"] = ["She told me to ...", ["782a", "782b"], []]
		character_dialogue_dict["782b"] = ["I just went home ...", ["782c", "782d"], []]
		character_dialogue_dict["783a"] = ["That's not fair", ["783a"], []]
		character_dialogue_dict["783b"] = ["What do I have to do for you to believe me?", ["783b"], []]
		##### END ######
		
		###### PLAYER ######
		### stage 1 ###
		# Tree 1:
		player_dialogue_dict["111a"] = ["We've met before.", "112a", []]
		player_dialogue_dict["111b"] = ["Likewise.", "112b", []]
		player_dialogue_dict["112a"] = ["Well, you haven't met me yet.", "211a", ["increase"]]
		player_dialogue_dict["112b"] = ["Yeah, just a few times.", "221a", ["neutral"]]
		player_dialogue_dict["112c"] = ["Of course.", "211a", ["increase"]]
		player_dialogue_dict["112d"] = ["Yeah, I might be a little rusty.", "221a", ["neutral"]]
		### stage 2 ###
		# Tree 1:
		player_dialogue_dict["211a"] = ["You know why I'm here, Amity.", "212a", []]
		player_dialogue_dict["211b"] = ["Just trying to pay my respects.", "212b", []]
		player_dialogue_dict["212a"] = ["I'm here to find my sister's killer.", "321a", ["increase"]]
		player_dialogue_dict["212b"] = ["I don't owe you anything.", "331a", ["neutral"]]
		player_dialogue_dict["212c"] = ["I've respected her my entire life.", "321a", ["increase"]]
		player_dialogue_dict["212d"] = ["You clearly didn't know me very well.", "311a", ["neutral"]]
		# Tree 2:
		player_dialogue_dict["221a"] = ["I don't remember.", "222a", []]
		player_dialogue_dict["221b"] = ["Yeah, when we were kids.", "222b", []]
		player_dialogue_dict["222a"] = ["I didn't come here for some game, I came for Iris.", "321a", ["increase"]]
		player_dialogue_dict["222b"] = ["I've made some mistakes. That's why I'm here.", "331a", ["neutral"]]
		player_dialogue_dict["222c"] = ["I only see one big difference.", "321a", ["increase"]]
		player_dialogue_dict["222d"] = ["She chose this life.", "331a", ["neutral"]]
		### stage 3 ###
		# Tree 1:
		player_dialogue_dict["311a"] = ["I wouldn't waste my time investigating someone I didn't respect.", "312a", []]
		player_dialogue_dict["311b"] = ["She was my sister. I knew her better than you did.", "312b", []]
		player_dialogue_dict["312a"] = ["She could have gone with me. She didn't need to live this way.", "421a", ["increase"]]
		player_dialogue_dict["312b"] = ["Why would I ever want to investigate my sister?", "441a", []]
		player_dialogue_dict["312c"] = ["Fine, if you're not going to help me, I'll just talk to Peter.", "411a", ["increase"]]
		player_dialogue_dict["312d"] = ["That wasn't what I wanted.", "441a", []]
		# Tree 2:
		player_dialogue_dict["321a"] = ["Are you going to help me, or not?", "322a", []]
		player_dialogue_dict["321b"] = ["Why should I trust you?", "322b", []]
		player_dialogue_dict["322a"] = ["I thought you'd want to help me.", "431a", ["increase"]]
		player_dialogue_dict["322b"] = ["I need your help.", "441a", ["neutral"]]
		player_dialogue_dict["322c"] = ["Peter.", "411a", ["increase"]]
		player_dialogue_dict["322d"] = ["No.", "441a", ["neutral"]]
		# Tree 3:
		player_dialogue_dict["331a"] = ["How was your relationship with Iris?", "332a", []]
		player_dialogue_dict["331b"] = ["What can you tell me about Boone?", "332b", []]
		player_dialogue_dict["332a"] = ["I thought you'd want to help me.", "431a", ["increase"]]
		player_dialogue_dict["332b"] = ["I need your help.", "441a", ["neutral"]]
		player_dialogue_dict["332c"] = ["How do you feel about that?", "431a", ["increase"]]
		player_dialogue_dict["332d"] = ["He have anything against Iris?", "441a", ["neutral"]]
		### stage 4 ###
		# Tree 1:
		player_dialogue_dict["411a"] = ["He's the only one here I might be able to trust.", "412a", []]
		player_dialogue_dict["411b"] = ["I'm not sure yet.", "412b", []]
		player_dialogue_dict["412a"] = ["Peter said the same thing.", "511a", ["increase"]]
		player_dialogue_dict["412b"] = ["You can make the choice to change that.", "541aa", ["neutral"]]
		player_dialogue_dict["412c"] = ["Then he's braver than you.", "511a", ["increase"]]
		player_dialogue_dict["412d"] = ["I can protect you both.", "531a", ["neutral"]]
		# Tree 2:
		player_dialogue_dict["421a"] = ["If I had a choice, then she had a choice.", "422a", []]
		player_dialogue_dict["421b"] = ["You don't know that.", "422b", []]
		player_dialogue_dict["422a"] = ["What makes you think it was easy?", "0", ["increase"]]
		player_dialogue_dict["422b"] = ["She would have had me.", "541aa", ["neutral"]]
		player_dialogue_dict["422c"] = ["Yes.", "0", ["increase"]]
		player_dialogue_dict["422d"] = ["I thought I did.", "541aa", ["neutral"]]
		# Tree 3:
		player_dialogue_dict["431a"] = ["I'm not just going to give up.", "432a", []]
		player_dialogue_dict["431b"] = ["I know it was someone here. You need to tell me who.", "432b", []]
		player_dialogue_dict["432a"] = ["Don't you want to clear your name?", "521a", ["increase"]]
		player_dialogue_dict["432b"] = ["Whoever you're scared of, I can protect you.", "531a", ["neutral"]]
		player_dialogue_dict["432c"] = ["Don't you want to clear your name?", "521a", ["increase"]]
		player_dialogue_dict["432d"] = ["No ... but you should [i]want[/i] to.", "541ab", ["neutral"]]
		# Tree 4:
		player_dialogue_dict["441a"] = ["I'm here to help you. You're not safe here.", "442a", []]
		player_dialogue_dict["441b"] = ["Let me prove you wrong.", "442b", []]
		player_dialogue_dict["442a"] = ["...", "541ac", ["neutral"]]
		player_dialogue_dict["442b"] = ["What?!", "541ac", ["neutral"]]
		player_dialogue_dict["442c"] = ["...", "541ac", ["neutral"]]
		player_dialogue_dict["442d"] = ["What?!", "541ac", ["neutral"]]
		### stage 5 ###
		# Tree 1:
		player_dialogue_dict["511a"] = ["You're the same way.", "512a", []]
		player_dialogue_dict["511b"] = ["Smart.", "512b", []]
		player_dialogue_dict["512a"] = ["You haven't told me anything.", "611a", ["increase"]]
		player_dialogue_dict["512b"] = ["I'm at risk just being here.", "631a", ["neutral"]]
		player_dialogue_dict["512c"] = ["Don't confuse stupidity with doing the right thing.", "621a", ["increase"]]
		player_dialogue_dict["512d"] = ["If Iris died, then no one is safe.", "631a", ["neutral"]]
		# Tree 2:
		player_dialogue_dict["521a"] = ["Prove it to me then.", "522a", []]
		player_dialogue_dict["521b"] = ["I believe you. I need your help.", "522b", []]
		player_dialogue_dict["522a"] = ["You haven't told me anything.", "611a", ["increase"]]
		player_dialogue_dict["522b"] = ["Listen. If Iris died, then no one is safe.", "631a", ["neutral"]]
		player_dialogue_dict["522c"] = ["Don't confuse stupidity with doing the right thing.", "621a", ["increase"]]
		player_dialogue_dict["522d"] = ["Listen. If Iris died, then no one is safe.", "631a", ["neutral"]]
		# Tree 3
		player_dialogue_dict["531a"] = ["Why not?", "532a", []]
		player_dialogue_dict["531b"] = ["How can you say that after Iris?", "532b", []]
		player_dialogue_dict["532a"] = ["I can only think of one reason why you wouldn't need protection.", "641a", ["increase"]]
		player_dialogue_dict["532b"] = ["Did they promise you something?", "651a", ["neutral"]]
		player_dialogue_dict["532c"] = ["I can only think of one reason why you wouldn't need protection.", "641a", ["increase"]]
		player_dialogue_dict["532d"] = ["Did they bribe you?", "651a", ["neutral"]]
		# Tree 4:
		player_dialogue_dict["541a"] = ["How do you know about that?!", "542a", []]
		player_dialogue_dict["541b"] = ["There was nothing I could do.", "542b", []]
		player_dialogue_dict["542a"] = ["That's not what she told me.", "661a", ["increase"]]
		player_dialogue_dict["542b"] = ["What else did she say?", "671a", ["neutral"]]
		player_dialogue_dict["542c"] = ["Where were you guys planning on going?", "661a", ["increase"]]
		player_dialogue_dict["542d"] = ["What else did she say?", "671a", ["neutral"]]
		### stage 6 ###
		# Tree 1:
		player_dialogue_dict["611a"] = ["Then stop stalling.", "612a", []]
		player_dialogue_dict["611b"] = ["Then just give me a name.", "612b", []]
		player_dialogue_dict["612a"] = ["Either you know who the killer is, or you are the killer.", "0", ["dismiss"]]
		player_dialogue_dict["612b"] = ["I will not leave until you tell me what you know.", "731a", ["neutral", "end_bluff"]]
		player_dialogue_dict["612c"] = ["Stop with the games.", "0", ["dismiss"]]
		player_dialogue_dict["612d"] = ["I'm not leaving until you give me a name.", "731a", ["neutral", "end_bluff"]]
		# Tree 2:
		player_dialogue_dict["621a"] = ["At least I'm not a coward.", "622a", []]
		player_dialogue_dict["621b"] = ["No one would know that you talked.", "622b", []]
		player_dialogue_dict["622a"] = ["I know enough.", "0", ["dismiss"]]
		player_dialogue_dict["622b"] = ["Prove me wrong.", "731a", ["neutral", "end_bluff"]]
		player_dialogue_dict["622c"] = ["Because you don't have to say anything. Just let me in ...", "0", ["dismiss"]]
		player_dialogue_dict["622d"] = ["I'm going to be talking to everyone. No one would know it was you.", "731a", ["neutral", "end_bluff"]]
		# Tree 3
		player_dialogue_dict["631a"] = ["That's not an option", "632a", []]
		player_dialogue_dict["631b"] = ["Amity, I made a mistake. I need to fix things.", "632b", []]
		player_dialogue_dict["632a"] = ["How about you stop and think about [i]your[/i] options for a second.", "0", ["dismiss"]]
		player_dialogue_dict["632b"] = ["Stop the games. I'm not leaving until you help me.", "731a", ["neutral", "end_bluff"]]
		player_dialogue_dict["632c"] = ["You don't know what you're talking about.", "721a", ["increase", "end_bluff"]]
		player_dialogue_dict["632d"] = ["There has to be something I can do.", "711a", ["neutral", "end_bluff"]]
		# Tree 4:
		player_dialogue_dict["641a"] = ["Or because you killed her.", "0", ["dismiss"]]
		player_dialogue_dict["641b"] = ["And Iris couldn't?", "642b", []]
		player_dialogue_dict["642c"] = ["It's okay. I have everything I need.", "0", ["force_breakpoint"]]
		# Tree 5:
		player_dialogue_dict["651a"] = ["Then answer the question.", "652a", []]
		player_dialogue_dict["651b"] = ["You're right. I'm sorry.", "652b", []]
		player_dialogue_dict["652a"] = ["Then I can only think of one reason why you wouldn't need protection.", "751a", ["increase", "end_bluff"]]
		player_dialogue_dict["652b"] = ["Then you have a lot of explaining to do.", "741a", ["neutral", "end_bluff"]]
		player_dialogue_dict["652c"] = ["Then I can only think of one reason why you wouldn't need protection.", "751a", ["increase", "end_bluff"]]
		player_dialogue_dict["652d"] = ["Then you have a lot of explaining to do.", "751a", ["neutral", "end_bluff"]]
		# Tree 6:
		player_dialogue_dict["661a"] = ["I know she didn't talk to you.", "662a", []]
		player_dialogue_dict["661b"] = ["You're hiding something.", "662b", []]
		player_dialogue_dict["662a"] = ["Boone is an idiot. What could he have done?", "771a", ["increase", "end_bluff"]]
		player_dialogue_dict["662b"] = ["She told me she was worried about you ...", "761a", ["increase", "end_bluff"]]
		player_dialogue_dict["662c"] = ["Boone is an idiot. What could he have done?", "771a", ["increase", "end_bluff"]]
		player_dialogue_dict["662d"] = ["She never mentioned Boone, she only mentioned you ...", "761a", ["increase", "end_bluff"]]
		# Tree 7
		player_dialogue_dict["671a"] = ["Are you sure about that?", "672a", []]
		player_dialogue_dict["671b"] = ["What was she scared of?", "672b", []]
		player_dialogue_dict["672a"] = ["Where did you go after?", "781a", ["increase", "end_bluff"]]
		player_dialogue_dict["672b"] = ["She mentioned you the last time I talked to her ... and I'm pretty sure I remember.", "761a", ["increase", "end_bluff"]]
		player_dialogue_dict["672c"] = ["Boone is an idiot, I doubt he could have had anything to do with this.", "771a", ["increase", "end_bluff"]]
		player_dialogue_dict["672d"] = ["Funny, I remember her saying something about you.", "761a", ["increase", "end_bluff"]]
		### stage 7 ###
		# Tree 1:
		player_dialogue_dict["711a"] = ["Stan ...", "712a", []]
		player_dialogue_dict["711b"] = ["Peter ...", "712b", []]
		player_dialogue_dict["712a"] = ["How do you know that?", "0", ["dismiss"]]
		player_dialogue_dict["712b"] = ["You?", "731a", ["neutral"]]
		player_dialogue_dict["712c"] = ["You sound quick to give up on a friend.", "0", ["dismiss"]]
		player_dialogue_dict["712d"] = ["Fine, I'll talk to him again. But I need something from you first.", "731a", ["neutral"]]
		player_dialogue_dict["713a"] = ["Why wouldn't Stan have said anything to me about this?", "0", ["dismiss"]]
		player_dialogue_dict["713b"] = ["What else did you find?", "731a", ["neutral"]]
		player_dialogue_dict["713c"] = ["Show me.", "0", ["dismiss"]]
		player_dialogue_dict["713d"] = ["I need to see for myself.", "731a", ["neutral"]]
		player_dialogue_dict["713d"] = ["Just relax ...", "731a", ["neutral"]]
		player_dialogue_dict["714a"] = ["I believe you, but there's one more thing I need.", "731a", ["neutral"]]
		player_dialogue_dict["713b"] = ["Just relax ...", "731a", ["neutral"]]
		# Tree 2:
		player_dialogue_dict["721a"] = ["What did you do?", "722a", []]
		player_dialogue_dict["721b"] = ["Tell me what you know.", "722b", []]
		player_dialogue_dict["722a"] = ["This sounds awfully convenient for you ...", "0", ["dismiss"]]
		player_dialogue_dict["722b"] = ["Boone?!", "731a", ["neutral"]]
		player_dialogue_dict["722c"] = ["He's scared.", "0", ["dismiss"]]
		player_dialogue_dict["722d"] = ["weird how?", "731a", ["neutral"]]
		player_dialogue_dict["723a"] = ["There's something we're missing ...", "722a", []]
		player_dialogue_dict["723b"] = ["Thank you. I just need one more thing from you ...", "722b", []]
		player_dialogue_dict["723c"] = ["What else are you hiding?", "0", ["dismiss"]]
		player_dialogue_dict["723d"] = ["Finally. I just need one more thing from you ...", "731a", ["neutral"]]
		player_dialogue_dict["723e"] = ["What else are you hiding?", "0", ["dismiss"]]
		player_dialogue_dict["723f"] = ["Finally. I just need one more thing from you ...", "731a", ["neutral"]]
		# Tree 3
		player_dialogue_dict["731a"] = ["Your memory does work.", "732a", []]
		player_dialogue_dict["731b"] = ["I need a name.", "732b", []]
		player_dialogue_dict["732a"] = ["I'd call it being a coward.", "0", ["dismiss"]]
		player_dialogue_dict["732b"] = ["Give me something I can use.", "731a", ["neutral"]]
		player_dialogue_dict["732c"] = ["What else are you hiding?", "721a", ["increase"]]
		player_dialogue_dict["732d"] = ["Finally. I just need one more thing from you ...", "711a", ["neutral"]]
		player_dialogue_dict["733a"] = ["What else are you hiding?", "732a", []]
		player_dialogue_dict["733b"] = ["Finally. I just need one more thing from you ...", "732b", []]
		# Tree 4:
		player_dialogue_dict["741a"] = ["You can start by telling me where you were when she died.", "0", ["dismiss"]]
		player_dialogue_dict["741b"] = ["It's not everyday the boss gets murdered. Is someone planning a take over?", "742b", []]
		player_dialogue_dict["742a"] = ["What'd you find?", "0", ["force_breakpoint"]]
		player_dialogue_dict["742b"] = ["Go on.", "731a", ["neutral"]]
		player_dialogue_dict["742c"] = ["Bullshit, stop with the games.", "721a", ["increase"]]
		player_dialogue_dict["742d"] = ["Who does?", "711a", ["neutral"]]
		player_dialogue_dict["743a"] = ["Any idea where she was going?", "732a", []]
		player_dialogue_dict["743b"] = ["A suitcase?", "732b", []]
		player_dialogue_dict["743c"] = ["What else are you hiding?", "732a", []]
		player_dialogue_dict["743d"] = ["Finally. I just need one more thing from you ...", "732b", []]
		player_dialogue_dict["744a"] = ["Now I just need you to show me ...", "732a", []]
		player_dialogue_dict["744b"] = ["I just need one more thing from you ...", "732b", []]
		# Tree 5:
		player_dialogue_dict["751a"] = ["Or because you killed her.", "752a", []]
		player_dialogue_dict["751b"] = ["And Iris couldn't?", "752b", []]
		player_dialogue_dict["752a"] = ["It's okay. I have everything I need.", "751a", ["increase"]]
		# Tree 6:
		player_dialogue_dict["761a"] = ["She said \"things weren't right with you.\" care to explain?", "762a", []]
		player_dialogue_dict["761b"] = ["How were things with you and Iris up until she died?", "762b", []]
		player_dialogue_dict["762a"] = ["It's your word against my sister's. I'm gonna go with my sister.", "771a", ["increase"]]
		player_dialogue_dict["762b"] = ["Then prove it to me.", "761a", ["increase"]]
		player_dialogue_dict["762c"] = ["That's not an answer.", "771a", ["increase"]]
		player_dialogue_dict["762d"] = ["Prove her wrong.", "761a", ["increase"]]
		player_dialogue_dict["763a"] = ["Just let me in ...", "771a", ["increase"]]
		player_dialogue_dict["763b"] = ["Just let me in ...", "761a", ["increase"]]
		# Tree 7
		player_dialogue_dict["771a"] = ["Bullshit.", "772a", []]
		player_dialogue_dict["771b"] = ["Go on.", "772b", []]
		player_dialogue_dict["772a"] = ["Sorry, I don't trust cowards.", "781a", ["increase"]]
		player_dialogue_dict["772b"] = ["Just one more thing ...", "771a", ["increase"]]
		player_dialogue_dict["772c"] = ["Stan?!", "771a", ["increase"]]
		player_dialogue_dict["772d"] = ["Finally. I just need one more thing from you ...", "771a", ["increase"]]
		player_dialogue_dict["773a"] = ["I just need one more thing from you ...", "771a", ["increase"]]
		# Tree 8
		player_dialogue_dict["781a"] = ["You just [i]left[/i] after she said she was scared?", "782a", []]
		player_dialogue_dict["781b"] = ["Where did you go?", "782b", []]
		player_dialogue_dict["782a"] = ["AND YOU LISTENED!?", "781a", ["increase"]]
		player_dialogue_dict["782b"] = ["This whole time you tried to make [i]me[/i] feel guilty...", "771a", ["increase"]]
		player_dialogue_dict["782c"] = ["You really expect me to believe that?", "771a", ["increase"]]
		player_dialogue_dict["782d"] = ["You have a chance to make this right ...", "761a", ["increase"]]
		player_dialogue_dict["783a"] = ["It's not fair for you to blame me either!", "771a", ["increase"]]
		player_dialogue_dict["783b"] = ["Help me make things right. For both of us.", "761a", ["increase"]]
		player_dialogue_dict["783c"] = ["Just one more thing ...", "771a", ["increase"]]
		##### END ######
		
		### NULL CASE ###
		character_dialogue_dict["0"] = [null, null, null]
		player_dialogue_dict["0"] = [null, null, null]
		
func playDialogue(key):
	# Erase old prompt
	if current_prompt != null:
		current_prompt.queue_free()
	# Erase old options
	while not(current_options.is_empty()):
		var prompt = current_options.pop_front()
		prompt.queue_free()
	# Terminate if null case is reached
	if key == "0":
		return
	# Lookup prompt string
	var prompt_text = Global.character_dialogue_dict[key][0]
	var prompt_size = len(prompt_text)
	# Lookup options array
	var options = Global.character_dialogue_dict[key][1]
	# Lookup actions array
	var actions = Global.character_dialogue_dict[key][2]
	# Create visual prompt
	current_prompt = dialogueBox.instantiate()
	current_prompt.get_node("Text").text = "[center]" + prompt_text + "[/center]"
	# Assign image for opponent response box
	current_prompt.get_node("AnimatedSprite").play()
	# Update text size to fit box (have to do in a roundabout way because there is no way to scale font size
	# differently for two labels displayed simultaneously)
	resize_text(current_prompt.get_node("Text"), prompt_size)
	get_tree().get_root().add_child(current_prompt) # adding to main

	# Create visual options
	var num_options = len(options)
	for i in num_options:
		# Lookup option string
		var option_text = Global.player_dialogue_dict[options[i]][0]
		var option_size = len(option_text)
		# Lookup prompts key (option outcomes)
		var prompt = Global.player_dialogue_dict[options[i]][1]
		# Lookup actions array
		var option_actions = Global.player_dialogue_dict[options[i]][2]
		# Create visual prompt
		var new_option = dialogueOption.instantiate()
		# Assign image for left vs right option
		if i % 2 == 0:
			# Select image
			new_option.get_node("LeftOpt").show()
			new_option.get_node("RightOpt").hide()
			# Set text
			new_option.get_node("LeftOpt").get_node("Text").text = "[center]" + option_text + "[/center]"
			# Update text size to fit box
			resize_text(new_option.get_node("LeftOpt").get_node("Text"), option_size)
		else:
			# Select image
			new_option.get_node("LeftOpt").hide()
			new_option.get_node("RightOpt").show()
			# Set text
			new_option.get_node("RightOpt").get_node("Text").text = "[center]" + option_text + "[/center]"
			# Update text size to fit box
			resize_text(new_option.get_node("RightOpt").get_node("Text"), option_size)
		# Assign the outcome to be triggered on button press
		new_option.outcome = prompt # here we assign the outcome to be triggered on button press
		new_option.actions = option_actions
		# Complete process
		current_options.append(new_option) # Store as current option
		get_tree().get_root().add_child(new_option) # adding to main
		
"""
* this function scales a text box to fit within a DialogueOption or DialogueBox object
* param: textBox: the text box object
* param: char_count: the number of (visible) characters in the text string being displayed by the textBox
"""
func resize_text(textBox, char_count):
	# Determine how many resizings must be performed based on number of characters in text string
	var scale_level = 0
	var rise_level = 0
	if char_count > 9:
		scale_level+=1
	if char_count > 18:
		scale_level+=1
	if char_count > 36:
		scale_level+=1
	if char_count > 11:
		rise_level+=3
	if char_count > 15:
		rise_level+=5
	if char_count > 36:
		rise_level+=12
	# Reduce scale to give the appearance of shrinking text
	textBox.scale = textBox.scale * pow(0.85, scale_level)
	# Increase size of textBox rect to counteract reduced scale
	textBox.size = textBox.size * pow(1.15, scale_level)
	# Reduce y origin of textBox rect to utilize space above the center of the DialogueBox or DialogueOption
	textBox.position.y = textBox.position.y - rise_level


func _on_headspace_music_start_finished():
	$HeadspaceMusicLoop.play() 
