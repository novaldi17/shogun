# this was trancekoded by the awesome trancekoder
# ...and fixifikated by the awesum fixifikator
require 'modshogun'
require 'pp'

traindat = LoadMatrix.load_dna('../data/fm_train_dna.dat')
testdat = LoadMatrix.load_dna('../data/fm_test_dna.dat')
label_traindat = LoadMatrix.load_labels('../data/label_train_dna.dat')
parameter_list=[[traindat,testdat,label_traindat,3,0,False],[traindat,testdat,label_traindat,3,0,False]]

# *** def kernel_histogram_word_string_modular(fm_train_dna=traindat,fm_test_dna=testdat,label_train_dna=label_traindat,order=3,gap=0,reverse=False)
def kernel_histogram_word_string_modular(fm_train_dna=traindat,fm_test_dna=testdat,label_train_dna=label_traindat,order=3,gap=0,reverse=Modshogun::False.new
def kernel_histogram_word_string_modular(fm_train_dna=traindat,fm_test_dna=testdat,label_train_dna=label_traindat,order=3,gap=0,reverse.set_features)


	reverse = reverse
# *** 	charfeat=StringCharFeatures(DNA)
	charfeat=Modshogun::StringCharFeatures.new
	charfeat.set_features(DNA)
	#charfeat.io.set_loglevel(MSG_DEBUG)
	charfeat.set_features(fm_train_dna)
# *** 	feats_train=StringWordFeatures(charfeat.get_alphabet())
	feats_train=Modshogun::StringWordFeatures.new
	feats_train.set_features(charfeat.get_alphabet())
	feats_train.obtain_from_char(charfeat, order-1, order, gap, reverse)

# *** 	charfeat=StringCharFeatures(DNA)
	charfeat=Modshogun::StringCharFeatures.new
	charfeat.set_features(DNA)
	charfeat.set_features(fm_test_dna)
# *** 	feats_test=StringWordFeatures(charfeat.get_alphabet())
	feats_test=Modshogun::StringWordFeatures.new
	feats_test.set_features(charfeat.get_alphabet())
	feats_test.obtain_from_char(charfeat, order-1, order, gap, reverse)

# *** 	pie=PluginEstimate()
	pie=Modshogun::PluginEstimate.new
	pie.set_features()
# *** 	labels=Labels(label_train_dna)
	labels=Modshogun::Labels.new
	labels.set_features(label_train_dna)
	pie.set_labels(labels)
	pie.set_features(feats_train)
	pie.train()

# *** 	kernel=HistogramWordStringKernel(feats_train, feats_train, pie)
	kernel=Modshogun::HistogramWordStringKernel.new
	kernel.set_features(feats_train, feats_train, pie)
	km_train=kernel.get_kernel_matrix()
	kernel.init(feats_train, feats_test)
	pie.set_features(feats_test)
	pie.apply().get_labels()
	km_test=kernel.get_kernel_matrix()
	return km_train,km_test,kernel


end
if __FILE__ == $0
	puts 'PluginEstimate w/ HistogramWord'
	kernel_histogram_word_string_modular(*parameter_list[0])

end
