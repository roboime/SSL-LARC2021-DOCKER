FROM ubuntu:18.04

# Dependencias
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install git -y \
	qt5-default \
	nano \
	net-tools \
	iputils-ping \
	sudo \
	wget \
	alien \
	xvfb \
	&& apt-get clean
RUN cd /home && mkdir labview-install && cd labview-install \ 
	&& wget https://doc-0g-0g-docs.googleusercontent.com/docs/securesc/grvdoh934grat2v25f2o2c3imelv37ul/f1eamvhrfrnn7hjr1bj3bqita6bbop1i/1650496425000/18270303598764450728/18270303598764450728/1Md4w7Mj6LBPk39HKzoPMRvjV71JLtSgc?e=download&ax=ACxEAsZvVTgEYg-QY4CKBIHekxroq4uVBkCiSK1p7EyXM5O-cYVNPaun-JYz9uqaQprsgwXVIkeP2u-FuvI00w8ADE8cQHGVD2RdYMeDLsvtz1v8icyb7QEKo0tIlcDQ73pTUiH9snIBImm3wpA3WLxAEraG42jNu2v4XaVnUmeAV1lF3trXB6NZv1kjUTK26Ywp_--b0QOZmB42s2Yge5P2PBC8GTSRLgI8JPGl1U1fFCRtMXi7NdkLQ3_jYb43oyQ2c0V9VmouQOd3svJCRM0gHaADJpNqoYDAf4F5IvpkQRI9T4KBdbH1PTHdm7YaBhVZ2V938zBI7ZfDHjvca_6ZCSzjdV4O4qfXT-cxGaqu87qp0A-dfAtmK1kg-3Y_Rd-HnXA-bOaMIDJXm_3Z4GypaUEXQzg3Dr0osbHzd2T6N-LgTv0liCaAK3GAGeUcGhJIs83fdK76ufShDZqQTFj4Hcve29RGKucaLXG7a1dsGP4w7-BkONMDFXGLbHlrXXXJpNjaUCnvsh8m4FM1kt5sy2Z_WO16pPMUgaK8GaOUbLag6oVrBPzcSUEHgEuBDwBXBYzKO9rD-tsA0AKsQLo3rBMm7EBjd8VLWB84BU8Hy7GlkctXi6aMjbOkNjJ7FqUwDtr2HIFIdWLajuMksoSSDpOkFJXjhiI9thMSSN6-XRpOHbWdbKnxGNlDa1_OsqtPdVdwk10mPW2_dg&authuser=0&nonce=kog5huios23o6&user=18270303598764450728&hash=bqu629ikr9sla5jm60oo4ef383tmuuov
RUN tar -xvzf lv2021-runtime.tgz && ./INSTALL
RUN cd /home && git clone https://github.com/roboime/SSL_AI.git && cd SSL_AI && git checkout larc2021_fixBugsMerge && git pull \
	&& cd .. && chmod -R 777 SSL_AI
EXPOSE 20011/udp

