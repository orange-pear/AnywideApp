angular.module('starter.GreenhouseService', [])

.service("GreenhouseService", function($q, $http) {

	return{
		//------------------------------------------
		// 获取大棚
		getGreenhouse : function(){
			var deferred = $q.defer();
			var promise = deferred.promise;

			$http.get(AC.GREENHOUSE_GET_GREENHOUSE())
				.success(
					function(data, status, headers, config) {
						deferred.resolve(data);
					}
				)
				.error(
					function(data, status, headers, config) {
						deferred.reject(status);
					}
				);

			promise.success = function(fn) {
				promise.then(fn);
				return promise;
			}
			promise.error = function(fn) {
				promise.then(null, fn);
				return promise;
			}
			return promise;
		},

		// 获取大棚信息
		getGreenhouseInfo : function(greenhouseid){
			var deferred = $q.defer();
			var promise = deferred.promise;

			$http.get(AC.GREENHOUSE_GET_INFO() + "?greenhouseid="+ greenhouseid)
				.success(
					function(data, status, headers, config) {
						deferred.resolve(data);
					}
				)
				.error(
					function(data, status, headers, config) {
						deferred.reject(status);
					}
				);

			promise.success = function(fn) {
				promise.then(fn);
				return promise;
			}
			promise.error = function(fn) {
				promise.then(null, fn);
				return promise;
			}
			return promise;
		},

		// 转让/取消转让
		// status: 1转让 0取消转让
		resell : function(landId, status){
			var deferred = $q.defer();
			var promise = deferred.promise;

			$http.post(AC.GREENHOUSE_RESELL() + "/"+ landId + "/" + status)
				.success(
					function(data, status, headers, config) {
						deferred.resolve(data);
					}
				)
				.error(
					function(data, status, headers, config) {
						deferred.reject(status);
					}
				);

			promise.success = function(fn) {
				promise.then(fn);
				return promise;
			}
			promise.error = function(fn) {
				promise.then(null, fn);
				return promise;
			}
			return promise;
		},
         // 土地托管 by wuyabuluo
         // status: 1托管 0取消托管
         resell1 : function(houstId ,landId, trusteeship){
         var deferred = $q.defer();
         var promise = deferred.promise;
         $http.post(AC.GREENHOUSE_TRUSTEESHIP() + "/"+ houstId + "/"+ landId + "/" + trusteeship)
         .success(
                  function(data, status, headers, config) {
                  deferred.resolve(data);
                  }
                  )
         .error(
                function(data, status, headers, config) {
                deferred.reject(status);
                }
                );
         
         promise.success = function(fn) {
         promise.then(fn);
         return promise;
         }
         promise.error = function(fn) {
         promise.then(null, fn);
         return promise;
         }
         return promise;
         },
	};
});
