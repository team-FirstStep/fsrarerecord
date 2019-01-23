class Song < ApplicationRecord

belongs_to :disc, optional: true

# ↑optional: trueをつけないと
# ActiveRecord::RecordInvalid (Validation failed: Disc must exist):
# とエラーが発生する
# ↓を参照した
# Rail5からbelongs_toのデフォルトが関連先の値を検査するようになった。
# Rails4と同様に関連先を検査しないようにするには、belongs_toにoptional: trueを付与すれば良い。
belongs_to :product, optional: true
end
